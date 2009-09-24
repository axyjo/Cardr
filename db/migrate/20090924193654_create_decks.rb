class CreateDecks < ActiveRecord::Migration
  def self.up
    create_table :decks do |t|
      t.column :model_id, :integer
      t.column :name, :string
      t.column :description, :text
      t.timestamps
    end
  end

  def self.down
    drop_table :decks
  end
end
