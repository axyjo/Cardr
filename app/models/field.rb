#A field in a fact.
class Field < ActiveRecord::Base
  belongs_to :fact
  belongs_to :field_model
end
