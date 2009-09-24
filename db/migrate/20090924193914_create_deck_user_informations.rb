class CreateDeckUserInformations < ActiveRecord::Migration
  def self.up
    create_table :deck_user_informations do |t|
      t.column :user_id, :integer
      t.column :deck_id, :integer
      t.column :active, :boolean
      
      t.column :hard_interval_min, :float
      t.column :hard_interval_max, :float
      t.column :mid_interval_min, :float
      t.column :mid_interval_max, :float
      t.column :easy_interval_min, :float
      t.column :easy_interval_max, :float
      
      t.column :delay0, :integer
      t.column :delay1, :integer
      t.column :delay2, :float
      
      t.column :collapse_time, :datetime
      
      t.column :high_priority, :text
      t.column :med_priority, :text
      t.column :low_priority, :text
      
      t.column :new_card_order, :integer
      t.column :new_card_spacing, :integer
      t.column :failed_card_max, :integer
      t.column :new_cards_per_day, :integer
      
      t.column :session_rep_limit, :integer
      t.column :session_time_limit, :integer
      
      t.column :card_count, :integer
      t.column :fact_count, :integer
      t.column :failed_now_count, :integer
      t.column :failed_soon_count, :integer
      t.column :rev_count, :integer
      t.column :new_count, :integer
      t.column :rev_card_order, :integer
      
      t.timestamps
    end
  end

  def self.down
    drop_table :deck_user_informations
  end
end
