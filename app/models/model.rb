class Model < ActiveRecord::Base
  has_many :representations
  has_many :decks
end
