class CreateFields < ActiveRecord::Migration
  def self.up
    create_table :fields do |t|
      t.column :fact_id, :integer
      t.column :representation_id, :integer
      t.column :value, :text
      t.timestamps
    end
  end

  def self.down
    drop_table :fields
  end
end
