class FieldsController < ApplicationController
  before_filter :login_required
  def create
    @fact = Fact.new(:deck_id => params[:deck_id])
    if @fact.save
      @field = Field.new(params[:field])
      @field.fact_id = @fact.id
      respond_to do |format|
        if @field.save
          @fact.primary_field_id = @field.id
          @fact.save
          flash[:notice] = 'Field was successfully created.'
          format.html { redirect_to(@fact) }
          format.xml  { render :xml => @field, :status => :created, :location => @fact }
        else¶
          format.html { render :action => "new" }
          format.xml  { render :xml => @fact.errors, :status => :unprocessable_entity }
        end
      end
    end
  end
end
