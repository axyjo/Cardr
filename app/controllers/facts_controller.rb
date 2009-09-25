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
    @fields = Field.find(:all, :conditions => {:fact_id => @fact.id})
    respond_to do |format|
      format.html
      format.xml { render :xml => @fact }
    end
  end
  
  def new
    @fact = Fact.new
    respond_to do |format|
      format.html
      format.xml { render :xml => @fact }
    end
  end
  
  def create
    @fact = Fact.new(params[:fact])
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