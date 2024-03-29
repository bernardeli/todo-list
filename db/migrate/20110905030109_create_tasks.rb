class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.text :description
      t.references :list
      t.boolean :private

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
