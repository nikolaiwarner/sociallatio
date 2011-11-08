class FriendsController < ApplicationController
  #before_filter :load_friend, :except => [:index, :new]
  authorize_resource

  respond_to :html, :json

  def autocomplete
    @friends = (params[:term] == "") ? [] : current_user.friends.where{ (name =~ '%'+my{params[:term]}+'%') }.limit(10)
    
    respond_with(@friends.collect{ |friend| friend.name })
  end


  def index
    @friends = current_user.friends.order('name ASC').page(params[:page]).per(100)
    respond_with(@friends)
  end
  
  def best
    @friends = current_user.friends.order('score DESC')
    respond_with(@friends)
  end
  
  def best_alltime
    @friends = current_user.friends.order('score_alltime DESC')
    respond_with(@friends)
  end
  
  def learn
    @friend = current_user.friends.random current_user
    respond_with(@friend)
  end

  def show
    @friend = current_user.friends.find_by_slug(params[:id], current_user)
    @interactions = @friend.interactions.order('datetime DESC').page(params[:page]).per(10)
    respond_with(@friend)
  end


  def new
    @friend = current_user.friends.new
    @friend.name = ""
    respond_with(@friend)
  end


  def edit
    @friend = current_user.friends.find_by_slug(params[:id], current_user)
  end


  def create
    @friend = current_user.friends.new(params[:friend])
    @friend.score = 0
    @friend.score_alltime = 0
    @friend.frequency = current_user.frequencies.last unless @friend.frequency
    
    respond_to do |format|
      if @friend.save
        format.html { redirect_to(@friend, :notice => 'Friend was successfully created.') }
        format.json { render :json => {'slug' => @friend.slug}.to_json }
      else
        format.html { render :action => "new" }
        format.json { render :json => {'errors' => @friend.errors}.to_json }
      end
    end
  end


  def update
    @friend = current_user.friends.find_by_slug(params[:id], current_user)

    respond_to do |format|
      if @friend.update_attributes(params[:friend])
        format.html { redirect_to(@friend, :notice => 'Friend was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @friend.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @friend = current_user.friends.find_by_slug(params[:id], current_user)
    @friend.destroy

    respond_to do |format|
      format.html { redirect_to(friends_url) }
      format.xml  { head :ok }
    end
  end


protected
  def load_friend
    @friend = current_user.friends.find_by_slug(params[:id], current_user)
  end
  
  
end
