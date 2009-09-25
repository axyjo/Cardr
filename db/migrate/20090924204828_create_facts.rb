class CreateFacts < ActiveRecord::Migration
  def self.up
    create_table :facts do |t|
      t.column :deck_id, :integer
      t.column :primary_field_id, :integer
      t.column :space_until, :float
      t.timestamps
    end
  end

  def self.down
    drop_table :facts
  end
end
