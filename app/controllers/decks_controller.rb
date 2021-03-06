class DecksController < ApplicationController
  before_filter :login_required
  def index
    @decks = Deck.all

    respond_to do |format|
      format.html
      format.xml { render :xml => @decks }
    end
  end

  def show
    @deck = Deck.find(params[:id])
    @fields = []
    @deck.facts.each do |fact|
      new_field = [Field.fact(fact.id).primary[0]]
      if new_field
        @fields = @fields + new_field
      end
    end
    respond_to do |format|
      format.html
      format.xml { render :xml => @deck }
    end
  end

  def new
    @deck = Deck.new
    @models = Model.find(:all, :order => :name)
    if @models.empty?
      logger.error("Deck creation attempted but no models created yet.")
      flash[:notice] = "You must create a model before you create a deck."
      redirect_to(:action => 'index')
    else
      respond_to do |format|
        format.html
        format.xml { render :xml => @deck }
      end
    end
  end

  def create
    @deck = Deck.new(params[:deck])
    respond_to do |format|
      if @deck.save
        flash[:notice] = 'Deck was successfully created.'
        format.html { redirect_to(@deck) }
        format.xml  { render :xml => @deck, :status => :created, :location => @deck }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @deck.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def review
    @deck = Deck.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    @deck = Deck.find(params[:id])
    @deck.destroy
    respond_to do |format|
      flash[:notice] = "Deck <em>"+@deck.name+"</em> was deleted."
      format.html { redirect_to(decks_url) }
      format.xml  { head :ok }
    end
  end
end
