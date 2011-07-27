class AlbumController < ApplicationController
 before_filter :require_authentication
 
 def index
   @current_user = Facebook.find_by_identifier(session[:fb_id])
   #@user=FbGraph::User.me(current_user.access_token).fetch
   #render :text=>@user.friends.albums.to_yaml and return
   @albums = FbGraph::Album.fetch(params[:id], :access_token =>@current_user.access_token)
  end


  def show_album
    @current_user = Facebook.find_by_identifier(session[:fb_id])
    #render :text =>current_user.access_token and return
    #render :text => session[:current_user] and return
    @user=FbGraph::User.me(@current_user.access_token).fetch
    @albums =@user.albums
    #render :text=>@user.to_yaml and return
    @album = FbGraph::Album.fetch(@albums.first.identifier, :access_token =>@current_user.access_token)
    #render :text=>@albums.
  end

  def show_album1
       @current_user = Facebook.find_by_identifier(session[:fb_id])
      @user=FbGraph::User.me(@current_user.access_token).fetch
      render :text=> @user.accounts.to_yaml and return
      
      @user.friends.each do |a|
         user1 = FbGraph::User.fetch(a.identifier,:access_token => current_user.access_token)
         #user1 = FbGraph::User.new(a.identifier, :access_token => current_user.access_token).fetch
        render :text => user1.albums.to_yaml and return
      end
  end

end
