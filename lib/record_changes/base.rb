module Changes
  module RecordChanges

    ## Define ModelMethods
    module Base
      def self.included(klass)
        klass.class_eval do
          extend Config
        end
      end
      
      module Config
        def record_changes
        
          # This is where arbitrary code goes that you want to 
          # add to the class that declared "acts_as_widget"
          
          has_many :resource_changes, :as => :logged_resource, :class_name => 'Changes::ResourceChange', :dependent => :destroy
          before_save :identify_changes

          include Changes::RecordChanges::Base::InstanceMethods
        end
      end
      
      module InstanceMethods
        
        def identify_changes
          unless self.new_record? && self.changed.empty?
            self.resource_changes.create(:log_changed => self.changed.to_json, :log_changes => self.changes.to_json)
          end
        end
        
        def show_changes(options={})
          all_changes = []
          self.resource_changes.order('created_at').each do |change|
            log = ""
            log_changed = JSON.parse(change.log_changed)
            log_changes = JSON.parse(change.log_changes)
            
            log_changed.each do |c|
              from = log_changes[c].first
              to = log_changes[c].last
              log << "#{c} from '#{from}' to '#{to}'\n"
            end
            all_changes << log
          end
          all_changes
        end
      end # InstanceMethods      
    end

  end
end

::ActiveRecord::Base.send :include, Changes::RecordChanges::Base
