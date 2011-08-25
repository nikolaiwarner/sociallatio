class InteractionsController < ApplicationController
  load_and_authorize_resource



  def index
    @interactions = Interaction.where(:user_id => current_user.id).order('datetime DESC').page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @interactions }
    end
  end



  def show
    @interaction = Interaction.where(:user_id => current_user.id).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @interaction }
    end
  end



  def new
    @interaction = Interaction.new

    @friend_name = params[:friend] || ""

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @interaction }
    end
  end


  def edit
    @interaction = Interaction.where(:user_id => current_user.id).find(params[:id])
    @friend_name = @interaction.friend.name
  end



  def create
   
    # muliple friends
    friend_names = []
    if params[:interaction_friend_name].include? ','
      friend_names = params[:interaction_friend_name].split(',').collect{|friend| friend.strip }
    else
      friend_names = [params[:interaction_friend_name].gsub(',','').strip]
    end
   
    friend_names.each do |friend_name|
      interaction = Interaction.new(params[:interaction])
      interaction.user = current_user
    
      friend = Friend.find_by_name friend_name
      if friend
        interaction.friend_id = friend.id 
    
        interaction.points ||= 0
      
        interaction.save
        
        friend.balance_points
      end
    end
   
    redirect_to(interactions_path, :notice => 'Interaction noted.')
  end



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



  def destroy
    @interaction = Interaction.where(:user_id => current_user.id).find(params[:id])
    @interaction.destroy

    respond_to do |format|
      format.html { redirect_to(interactions_url) }
      format.xml  { head :ok }
    end
  end
end
