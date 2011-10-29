class InteractionTypesController < ApplicationController
  load_and_authorize_resource

  # GET /interaction_types
  # GET /interaction_types.xml
  def index
    @interaction_types = current_user.interaction_types.order('points ASC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @interaction_types }
    end
  end

  # GET /interaction_types/1
  # GET /interaction_types/1.xml
  def show
    @interaction_type = current_user.interaction_types.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @interaction_type }
    end
  end

  # GET /interaction_types/new
  # GET /interaction_types/new.xml
  def new
    @interaction_type = current_user.interaction_types.new
 
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @interaction_type }
    end
  end

  # GET /interaction_types/1/edit
  def edit
    @interaction_type = current_user.interaction_types.find(params[:id])
  end

  # POST /interaction_types
  # POST /interaction_types.xml
  def create
    @interaction_type = current_user.interaction_types.new(params[:interaction_type])

    respond_to do |format|
      if @interaction_type.save
        format.html { redirect_to(@interaction_type, :notice => 'Interaction type was successfully created.') }
        format.xml  { render :xml => @interaction_type, :status => :created, :location => @interaction_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @interaction_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /interaction_types/1
  # PUT /interaction_types/1.xml
  def update
    @interaction_type = current_user.interaction_types.find(params[:id])

    respond_to do |format|
      if @interaction_type.update_attributes(params[:interaction_type])
        format.html { redirect_to(@interaction_type, :notice => 'Interaction type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @interaction_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /interaction_types/1
  # DELETE /interaction_types/1.xml
  def destroy
    @interaction_type = current_user.interaction_types.find(params[:id])
    @interaction_type.destroy

    respond_to do |format|
      format.html { redirect_to(interaction_types_url) }
      format.xml  { head :ok }
    end
  end
end
