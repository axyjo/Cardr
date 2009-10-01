class CardRepresentationsController < ApplicationController
  def create
    @rep = CardRepresentations.new(params[:card_representations])
    @rep.model_id = params[:model_id]
    respond_to do |format|
      if @rep.save
        flash[:notice] = 'Representation was successfully created.'
        format.html { redirect_to(@rep.model) }
        format.xml  { render :xml => @rep, :status => :created, :location => @rep }
      else
        format.html { render :controller => "models", :action => "new" }
        format.xml  { render :xml => @rep.errors, :status => :unprocessable_entity }
      end
    end
  end
end
