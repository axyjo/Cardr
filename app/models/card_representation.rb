class CardRepresentation < ActiveRecord::Base
  belongs_to :model
  has_many :cards
  has_one :question, :class_name => "Representation"
  has_one :answer, :class_name => "Representation"

  def question
    Representation.find(self.question_id)
  end

  def answer
    Representation.find(self.answer_id)
  end
end
