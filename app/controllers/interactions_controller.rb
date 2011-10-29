class InteractionsController < ApplicationController
  load_and_authorize_resource



  def index
    @interactions = current_user.interactions.order('datetime DESC').page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @interactions }
    end
  end



  def show
    @interaction = current_user.interactions.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @interaction }
    end
  end



  def new
    @interaction = current_user.interactions.new

    @friend_name = params[:friend] || ""

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @interaction }
    end
  end


  def edit
    @interaction = current_user.interactions.find(params[:id])
    @friend_name = @interaction.friend.name
  end



  def create
    missing_friends = []
    missing_friends_notice_string = ""
  
    # deal with all those wonderful, muliple friends that you seem to have at a single event
    friend_names = []
    if params[:interaction_friend_name].include? ','
      friend_names = params[:interaction_friend_name].split(',').collect{|friend| friend.strip }
    else
      friend_names = [params[:interaction_friend_name].gsub(',','').strip]
    end
   
   
    friend_names.each do |friend_name|
      interaction = current_user.interactions.new(params[:interaction])
    
      friend = current_user.friends.find_by_name friend_name
      if friend
        interaction.friend = friend
    
        interaction.points ||= 0
      
        interaction.save
        
        friend.balance_points!    
      else
        missing_friends.push friend_name
      end
    end
  
    if missing_friends.count > 0
      missing_friends_notice_string = " However, these friend names were not found: " + missing_friends.join(",")
    end      

    redirect_to(interactions_path, :notice => 'Interaction noted.')
  end



  def update
    @interaction = current_user.interactions.find(params[:id])

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
    @interaction = current_user.interactions.find(params[:id])
    @interaction.destroy

    respond_to do |format|
      format.html { redirect_to(interactions_url) }
      format.xml  { head :ok }
    end
  end
end
