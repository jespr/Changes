module Changes
  class ResourceChange < ActiveRecord::Base
    belongs_to :logged_resource, :polymorphic => true
    
  end
end