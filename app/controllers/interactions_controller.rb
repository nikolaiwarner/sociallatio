class InteractionsController < ApplicationController
  load_and_authorize_resource

  # GET /interactions
  # GET /interactions.xml
  def index
    @interactions = Interaction.where(:user_id => current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @interactions }
    end
  end

  # GET /interactions/1
  # GET /interactions/1.xml
  def show
    @interaction = Interaction.where(:user_id => current_user.id).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @interaction }
    end
  end

  # GET /interactions/new
  # GET /interactions/new.xml
  def new
    @interaction = Interaction.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @interaction }
    end
  end

  # GET /interactions/1/edit
  def edit
    @interaction = Interaction.where(:user_id => current_user.id).find(params[:id])
  end

  # POST /interactions
  # POST /interactions.xml
  def create
    @interaction = Interaction.new(params[:interaction])

    @interaction.user = current_user
   
    @friend = Friend.find_by_name params[:interaction_friend_name]
    @interaction.friend_id = @friend.id if @friend
    
    @interaction.points ||= 0

    respond_to do |format|
      if @interaction.save
        format.html { redirect_to(friend_path(@interaction.friend), :notice => 'Interaction was successfully created.') }
        format.xml  { render :xml => @interaction, :status => :created, :location => @interaction }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @interaction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /interactions/1
  # PUT /interactions/1.xml
  def update
    @interaction = Interaction.where(:user_id => current_user.id).find(params[:id])

    respond_to do |format|
      if @interaction.update_attributes(params[:interaction])
        format.html { redirect_to(friend_path(@interaction.friend), :notice => 'Interaction was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @interaction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /interactions/1
  # DELETE /interactions/1.xml
  def destroy
    @interaction = Interaction.where(:user_id => current_user.id).find(params[:id])
    @interaction.destroy

    respond_to do |format|
      format.html { redirect_to(interactions_url) }
      format.xml  { head :ok }
    end
  end
end
