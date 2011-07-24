class CreateChangesTable < ActiveRecord::Migration
  def self.up
    create_table  :resource_changes, :force => true do |t|
      t.text      :log_changed
      t.text      :log_changes
      t.string    :logged_resource_type
      t.integer   :logged_resource_id
      t.datetime  :created_at
      t.datetime  :updated_at
    end
  end

  def self.down
    drop_table :changes
  end
end