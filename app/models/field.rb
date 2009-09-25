#A field in a fact.
class Field < ActiveRecord::Base
  belongs_to :fact
  belongs_to :field_model
  
  named_scope :fact, lambda { |*args| {:conditions => ['fact_id = ?', args.first]} }
  named_scope :primary, :include => :fact, :conditions => ['facts.primary_field_id = fields.id']
end
