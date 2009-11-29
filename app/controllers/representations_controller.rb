class RepresentationsController < ApplicationController
  before_filter :login_required
  def index
    @representations = Representation.all
    
    respond_to do |format|
      format.html
      format.xml { render :xml => @representations }
    end
  end
  
  def show
    @representation = Representation.find(params[:id])
    
    respond_to do |format|
      format.html
      format.xml { render :xml => @representation }
    end
  end
  
  def new
    @representation = Representation.new
    @models = Model.find(:all, :order => :name)
    respond_to do |format|
      format.html
      format.xml { render :xml => @representation }
    end
  end
  
  def create
    @representation = Representation.new(params[:representation])
    @model = Model.find(params[:model_id])
    @representation = @model.representations.build(params[:representation])
    respond_to do |format|
      if @representation.save
        flash[:notice] = 'Representation was successfully created.'
        format.html { redirect_to(@model) }
        format.xml  { render :xml => @representation, :status => :created, :location => @representation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @representation.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def edit
    @representation = Representation.find(params[:id])
  end
  
  def update
    @representation = Representation.find(params[:id])

    respond_to do |format|
      if @representation.update_attributes(params[:representation])
        flash[:notice] = 'Representation <em>'+@representation.name+'</em> was successfully updated.'
        format.html { redirect_to(@representation) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @representation.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @representation = Representation.find(params[:id])
    @representation.destroy
    respond_to do |format|
      flash[:notice] = "Representation <em>"+@representation.id+"</em> was deleted."
      format.html { redirect_to(representations_url) }
      format.xml  { head :ok }
    end
  end
end
