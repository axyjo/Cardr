# A single fact consisting of multiple fields.
class Fact < ActiveRecord::Base
  has_many :fields
  belongs_to :deck
end
