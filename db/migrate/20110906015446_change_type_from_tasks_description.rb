class ChangeTypeFromTasksDescription < ActiveRecord::Migration
  def self.up
    change_column :tasks, :description, :string
  end

  def self.down
    change_column :tasks, :description, :text
  end
end
