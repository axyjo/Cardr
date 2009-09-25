class CreateDeckUserInformations < ActiveRecord::Migration
  def self.up
    create_table :deck_user_informations do |t|
      t.column :user_id, :integer
      t.column :deck_id, :integer
      t.column :active, :boolean

      #initial intervals
      t.column :hard_interval_min, :float, :null => false, :default => 0.333
      t.column :hard_interval_max, :float, :null => false, :default => 0.5
      t.column :mid_interval_min, :float, :null => false, :default => 3.0
      t.column :mid_interval_max, :float, :null => false, :default => 5.0
      t.column :easy_interval_min, :float, :null => false, :default => 7.0
      t.column :easy_interval_max, :float, :null => false, :default => 9.0

      #failure delays
      t.column :delay0, :integer, :null => false, :default => 600
      t.column :delay1, :integer, :null => false, :default => 600
      t.column :delay2, :float, :null => false, :default => 0.0

      #collapsing future cards
      t.column :collapse_time, :datetime

      #priorities and postponing
      t.column :high_priority, :string, :null => false, :default => 'PriorityVeryHigh'
      t.column :med_priority, :string, :null => false, :default => 'PriorityHigh'
      t.column :low_priority, :string, :null => false, :default => 'PriorityLow'
      t.column :suspended, :string, :null => false, :default => ''

      # 0 is random 1 is by input date
      t.column :new_card_order, :integer, :null => false, :default => 1
      #when to show new cards
      # 0 = distribute, 1 = last, 2 = first
      t.column :new_card_spacing, :integer, :null => false, :default => 0
      #limit number of failed cards in play
      t.column :failed_card_max, :integer, :null => false, :default => 20
      #number of new cards to show per day
      t.column :new_cards_per_day, :integer, :null => false, :default => 20

      #count cache, probably unneeded.
      t.column :card_count, :integer
      t.column :fact_count, :integer
      t.column :failed_now_count, :integer
      t.column :failed_soon_count, :integer
      t.column :rev_count, :integer
      t.column :new_count, :integer
      #revision order
      t.column :rev_card_order, :integer

      t.timestamps
    end
  end

  def self.down
    drop_table :deck_user_informations
  end
end
