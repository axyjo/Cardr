class Representation < ActiveRecord::Base
  belongs_to :model
  belongs_to :card_representation, :polymorphic => true
  has_many :fields
end
