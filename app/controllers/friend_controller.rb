class FriendController < ApplicationController
 before_filter :require_authentication
  def index
      @user=FbGraph::User.me(current_user.access_token).fetch
      #render :text=> @user.fetch.friends.to_yaml and return
      @friends=@user.friends
      #render :text=>@friends.next.to_yaml and return
      #@user.friends.each do |a|
      #   user1 = FbGraph::User.fetch(a.identifier,:access_token => current_user.access_token)
         #user1 = FbGraph::User.new(a.identifier, :access_token => current_user.access_token).fetch
      #  render :text => user1.albums.to_yaml and return
   #end 
  end

  def page
    #render :text =>current_user.access_token and return
    #@data=Facebook.find_by_identifier(session[:fb_id])
    #render :text=> @data.access_token and return 
    @current_user = Facebook.find_by_identifier(session[:fb_id]) 
    @user=FbGraph::User.me(@current_user.access_token).fetch
    @pages=@user.likes
    #render :text =>@pages.next.count and return
    #render :text=> @user.likes.to_yaml and return
  end

  def view_page_album
      page=params[:page].to_i
      #render :text=>params[:page].to_i and return
      #render :text=>params[:id]      
      @current_user = Facebook.find_by_identifier(session[:fb_id])
      @page = FbGraph::Page.fetch(params[:id],:access_token =>@current_user.access_token)      
      @albums=@page.albums
      @paginate=@albums
      if page==0||page==1
        
      else 
         while(page>1)
            @albums=@albums.next
            page=page-1      
         end
        #render :text=>'aaa' and return     
      end  
      #@albums=@page.albums  #.next.next      
      #render :text=>@albums.next.next.count and return
  end
 
  def view_album_photos
      #render :text=>params[:action] and return
      page=params[:page].to_i
      @current_user = Facebook.find_by_identifier(session[:fb_id])
      @albums = FbGraph::Album.fetch(params[:id], :access_token =>@current_user.access_token)
      @photos= @albums.photos
      
      #render :text=>@photos.next.to_yaml and return
 
      @paginate=@photos
      
       if page==0||page==1
        
      else
         while(page>1)
            @photos= @photos.next
            page=page-1      
         end
        #render :text=>'aaa' and return
      end




      #render :text => @photos.to_yaml
  end
  
  def paginate
  end
  
  def destroy_session
     session[:fb_id]=nil
     redirect_to :controller =>'top'
     #render :text =>session[:fb_id] 
  end

end
