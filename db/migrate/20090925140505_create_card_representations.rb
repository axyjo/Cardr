class CreateCardRepresentations < ActiveRecord::Migration
  def self.up
    create_table :card_representations do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :card_representations
  end
end
