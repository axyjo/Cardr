class CreateModels < ActiveRecord::Migration
  def self.up
    create_table :models do |t|
      t.column :name, :string
      t.column :description, :text
      t.column :spacing, :float, :default => 600.0
      t.timestamps
    end
  end

  def self.down
    drop_table :models
  end
end
