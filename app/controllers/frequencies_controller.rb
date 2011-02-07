class FrequenciesController < ApplicationController
  load_and_authorize_resource

  # GET /frequencies
  # GET /frequencies.xml
  def index
    @frequencies = Frequency.where(:user_id => current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @frequencies }
    end
  end

  # GET /frequencies/1
  # GET /frequencies/1.xml
  def show
    @frequency = Frequency.where(:user_id => current_user.id).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @frequency }
    end
  end

  # GET /frequencies/new
  # GET /frequencies/new.xml
  def new
    @frequency = Frequency.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @frequency }
    end
  end

  # GET /frequencies/1/edit
  def edit
    @frequency = Frequency.where(:user_id => current_user.id).find(params[:id])
  end

  # POST /frequencies
  # POST /frequencies.xml
  def create
    @frequency = Frequency.new(params[:frequency])
    
    @frequency.user = current_user

    respond_to do |format|
      if @frequency.save
        format.html { redirect_to(@frequency, :notice => 'Frequency was successfully created.') }
        format.xml  { render :xml => @frequency, :status => :created, :location => @frequency }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @frequency.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /frequencies/1
  # PUT /frequencies/1.xml
  def update
    @frequency = Frequency.where(:user_id => current_user.id).find(params[:id])

    respond_to do |format|
      if @frequency.update_attributes(params[:frequency])
        format.html { redirect_to(@frequency, :notice => 'Frequency was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @frequency.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /frequencies/1
  # DELETE /frequencies/1.xml
  def destroy
    @frequency = Frequency.where(:user_id => current_user.id).find(params[:id])
    @frequency.destroy

    respond_to do |format|
      format.html { redirect_to(frequencies_url) }
      format.xml  { head :ok }
    end
  end
end
