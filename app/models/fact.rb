# A single fact consisting of multiple fields.
class Fact < ActiveRecord::Base
  has_many :fields
  has_one :field, :as => :primary_field
  belongs_to :deck
  
  def primary_field
    Field.find(self.primary_field_id)
  end
end
