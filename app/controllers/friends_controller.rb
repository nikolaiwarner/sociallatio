class FriendsController < ApplicationController
  #before_filter :load_friend, :except => [:index, :new]
  authorize_resource

  respond_to :html, :json

  def autocomplete
    @friends = (params[:term] == "") ? [] : Friend.limit(10).where(:user_id => current_user.id, :name.matches => '%'+params[:term]+'%')
    respond_with(@friends.collect{ |friend| friend.name })
  end


  def index
    @friends = Friend.where(:user_id => current_user.id).order('name ASC')
    respond_with(@friends)
  end
  
  def best
    @friends = Friend.where(:user_id => current_user.id).order('score DESC')
    respond_with(@friends)
  end

  def show
    @friend = Friend.where(:user_id => current_user.id).find_by_slug(params[:id])
    respond_with(@friend)
  end


  def new
    @friend = Friend.new
    respond_with(@friend)
  end


  def edit
    @friend = Friend.where(:user_id => current_user.id).find_by_slug(params[:id])
  end


  def create
    @friend = Friend.new(params[:friend])
    @friend.user = current_user
    @friend.score = 0

    respond_to do |format|
      if @friend.save
        format.html { redirect_to(@friend, :notice => 'Friend was successfully created.') }
        format.xml  { render :xml => @friend, :status => :created, :location => @friend }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @friend.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    @friend = Friend.where(:user_id => current_user.id).find_by_slug(params[:id])



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
    @friend = Friend.where(:user_id => current_user.id).find_by_slug(params[:id])
    @friend.destroy

    respond_to do |format|
      format.html { redirect_to(friends_url) }
      format.xml  { head :ok }
    end
  end


protected
  def load_friend
    @friend = Friend.find_by_slug(params[:id])
  end
  
  
end
