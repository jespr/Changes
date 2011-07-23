class CreateChangesTable < ActiveRecord::Migration
  def self.up
    create_table  :changes, :force => true do |t|
      t.text      :log
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