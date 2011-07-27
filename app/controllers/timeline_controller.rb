class TimelineController < ApplicationController
  before_filter :require_authentication

  def show
    #@data =current_user
    #render :text =>session[:fb_id] and return
    @current_user = Facebook.find_by_identifier(session[:fb_id])    
    @user=FbGraph::User.me(@current_user.access_token).fetch
    @albums = FbGraph::Album.fetch(@user.albums.first.identifier, :access_token =>@current_user.access_token)
    #@albums.photos
    @posts = @current_user.profile.home
  end

  def create
    current_user.profile.feed!(
      :message => params[:message]
    )
    redirect_to timeline_url
  end

end
