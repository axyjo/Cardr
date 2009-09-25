class Representation < ActiveRecord::Base
  belongs_to :model
  has_many :fields
end
