class CreateRepresentations < ActiveRecord::Migration
  def self.up
    create_table :representations do |t|
      t.column :model_id, :integer
      t.column :name, :string
      t.column :description, :text
      t.timestamps
    end
  end

  def self.down
    drop_table :representations
  end
end
