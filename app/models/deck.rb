class Deck < ActiveRecord::Base
  has_many :deck_user_information
  belongs_to :model
end
