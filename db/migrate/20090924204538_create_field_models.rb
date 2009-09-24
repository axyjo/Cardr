class CreateFieldModels < ActiveRecord::Migration
  def self.up
    create_table :field_models do |t|
      t.column :model_id, :integer
      t.column :name, :string
      t.column :description, :text
      t.column :required, :boolean, :default => 0
      t.column :unique, :boolean, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :field_models
  end
end
