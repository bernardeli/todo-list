class RemovePrivateFromTasks < ActiveRecord::Migration
  def self.up
    remove_column :tasks, :private
  end

  def self.down
    add_column :tasks, :private, :boolean
  end
end
