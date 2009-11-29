class FactsController < ApplicationController
  before_filter :login_required
  def index
    @facts = Fact.all

    respond_to do |format|
      format.html
      format.xml { render :xml => @facts }
    end
  end

  def show
    @fact = Fact.find(params[:id])
    respond_to do |format|
      format.html
      format.xml { render :xml => @fact }
    end
  end

  def new
    @fact = Fact.new(:deck_id => params[:id])
    @deck = Deck.find(params[:id])
    @deck.model.representations.each do |rep|
      @fact.fields.build(:representation_id => rep.id)
    end
    if @deck.model.representations.empty?
      logger.error("Fact creation attempted but no representations created yet.")
      flash[:notice] = "You must create a representation for your model before you create a fact."
      redirect_to(:controller => 'decks' , :action => 'show', :id => @deck.id)
    else
      respond_to do |format|
        format.html
        format.xml { render :xml => @fact }
      end
    end
  end

  def create
    @fact = Fact.new(:deck_id => params[:fact][:deck_id])
    if @fact.save
      params[:fact][:field_attributes].each do |attributes|
        f = Field.new(attributes)
        f.fact_id = @fact.id
        f.save
      end
      @field = Field.fact(@fact.id).representation_id(params[:primary_field_id])[0]
      @fact.primary_field_id = @field.id
      respond_to do |format|
        if @fact.save
          flash[:notice] = 'Fact was successfully created.'
          format.html { redirect_to(@fact) }
          format.xml  { render :xml => @fact, :status => :created, :location => @fact }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @fact.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  def edit
    @fact = Fact.find(params[:id])
  end

  def update
    @fact = Fact.find(params[:id])

    respond_to do |format|
      if @fact.update_attributes(params[:fact])
        flash[:notice] = 'Fact <em>'+@fact.name+'</em> was successfully updated.'
        format.html { redirect_to(@fact) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fact.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @fact = Fact.find(params[:id])
    @fact.destroy
    respond_to do |format|
      flash[:notice] = "Fact <em>"+@fact.id+"</em> was deleted."
      format.html { redirect_to(facts_url) }
      format.xml  { head :ok }
    end
  end
end
