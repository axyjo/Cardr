class CreateRepresentations < ActiveRecord::Migration
  def self.up
    create_table :representations do |t|
      t.column :model_id, :integer
      t.column :name, :string
      t.column :description, :text
      t.column :active, :boolean
      t.column :qformat, :text
      t.column :aformat, :text
      t.timestamps
    end
  end

  def self.down
    drop_table :representations
  end
end
