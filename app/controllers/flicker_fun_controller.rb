require 'rubygems'
#require 'image_downloader'
require 'flickraw'
require 'open-uri'

class FlickerFunController < ApplicationController
  def index
   #render :text => "#{RAILS_ROOT}/public/images/fb_use/" and return
   if params[:path]!=nil
     #writeOut = open("#{RAILS_ROOT}/public/images/fb_use/", "wb")
     #session[:path]=params[:path]   
     #writeOut.write(open(full_url).read)
     #writeOut.close    
     open("#{RAILS_ROOT}/public/images/fb_use", 'wb') do |file|
        file << open('http://example.com/image.png').read
     end

   end
   FlickRaw.api_key="d034e7a467967b7624b037b8a73050c4"
   FlickRaw.shared_secret="879cbcfe38123374"
   #puts flickr.auth.oauth.getAccessToken
   frob = flickr.auth.getFrob
   #auth=flickr.auth.getToken :frob =>frob
   #render :text=>auth and return
   @auth_url = FlickRaw.auth_url :frob => frob, :perms =>'write' #,:callback=>'http://220.227.26.90:3001'  
   if params[:frob]!=nil
    #path="thalassery-fort.jpg"
    #flickr.upload_photo path, :title => "Title", :description => "This is the description"
   
    @auth=flickr.auth.getToken :frob =>params[:frob]
    path ="thalassery-fort.jpg"
    flickr.upload_photo session[:path], :title => 'Title', :description => 'This is the description' 
    list = flickr.interestingness.getList :per_page => 20 
    #render :text =>@auth.token and return
    render :text =>list.to_yaml and return
   end 
  end

end
