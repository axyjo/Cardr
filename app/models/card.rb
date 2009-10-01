class Card < ActiveRecord::Base
  belongs_to :deck
  belongs_to :card_representation
  has_one :question, :class_name => "Representation"
  has_one :answer, :class_name => "Representation"
end
