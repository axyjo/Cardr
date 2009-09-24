class Deck < ActiveRecord::Base
  has_many :deck_user_information
  has_many :facts
  belongs_to :model
end
