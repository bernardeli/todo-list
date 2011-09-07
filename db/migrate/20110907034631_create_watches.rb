class CreateWatches < ActiveRecord::Migration
  def self.up
    create_table :watches do |t|
      t.references :list
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :watches
  end
end
