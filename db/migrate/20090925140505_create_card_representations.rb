class CreateCardRepresentations < ActiveRecord::Migration
  def self.up
    create_table :card_representations do |t|
      t.column :model_id, :integer
      t.column :question_id, :integer
      t.column :answer_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :card_representations
  end
end
