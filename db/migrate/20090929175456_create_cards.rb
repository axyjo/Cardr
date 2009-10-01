class CreateCards < ActiveRecord::Migration
  def self.up
    create_table :cards do |t|
      t.column :card_representation_id, :integer
      t.column :question_id, :integer
      t.column :answer_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :cards
  end
end
