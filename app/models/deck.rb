class Deck < ActiveRecord::Base
  has_many :deck_user_information
  has_many :facts
  has_many :cards
  belongs_to :model
  
  validates_presence_of :model
end
