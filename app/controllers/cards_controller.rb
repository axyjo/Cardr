class CardsController < ApplicationController
  def generate
    deck = Deck.find(params[:id])
    if deck.nil?
      flash[:error] = 'No such deck found.'
      redirect_to root_url
    end

    #Get model's card representations
    card_reps = deck.model.card_representations
    #Get all facts in deck
    facts = deck.facts

    card_reps.each do |card_rep|
      #representation id for questions/answers
      question_id = card_rep.question.id
      answer_id = card_rep.answer.id
      questions = Field.find(:all, :conditions => {:representation_id => question_id} )

      questions.each do |question|
        answer = Field.find(:first, :conditions => {:representation_id => answer_id, :fact_id => question.fact_id} )
        card = Card.new()
        #save fields
        card.question_id = question.id
        card.answer_id = answer.id
        card.card_representation_id = card_rep.id
        #save card
        card.save
      end
    end

    flash[:notice] = 'Deck cards were successfully created.'
    redirect_to(deck)
  end
end
