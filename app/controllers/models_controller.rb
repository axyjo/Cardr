class ModelsController < ApplicationController
  before_filter :login_required
  def index
    @models = Model.all

    respond_to do |format|
      format.html
      format.xml { render :xml => @models }
    end
  end

  def show
    @model = Model.find(params[:id])
    respond_to do |format|
      format.html
      format.xml { render :xml => @model }
    end
  end

  def new
    @model = Model.new
    respond_to do |format|
      format.html
      format.xml { render :xml => @model }
    end
  end

  def create
    @model = Model.new(params[:model])
    respond_to do |format|
      if @model.save
        flash[:notice] = 'Model was successfully created.'
        format.html { redirect_to(@model) }
        format.xml  { render :xml => @model, :status => :created, :location => @model }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @model.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @model = Model.find(params[:id])
  end

  def update
    @model = Model.find(params[:id])

    respond_to do |format|
      if @model.update_attributes(params[:model])
        flash[:notice] = 'Model <em>'+@model.name+'</em> was successfully updated.'
        format.html { redirect_to(@model) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @model.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @model = Model.find(params[:id])
    @model.destroy
    respond_to do |format|
      flash[:notice] = "Model <em>"+@model.id+"</em> was deleted."
      format.html { redirect_to(models_url) }
      format.xml  { head :ok }
    end
  end
end
