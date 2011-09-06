class AddPrivateToList < ActiveRecord::Migration
  def self.up
    add_column :lists, :private, :boolean
  end

  def self.down
    remove_column :lists, :private
  end
end
