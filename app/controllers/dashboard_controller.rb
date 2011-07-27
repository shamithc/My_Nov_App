class DashboardController < ApplicationController
  before_filter :require_authentication

  def show
    #render :text=>Facebook.find_by_identifier(session[:fb_id]).identifier and return
    #render :text=> current_user.identifier and return
    #render :text =>session[:fb_id] and return  
    #redirect_to :controller =>"dashboard" , :action =>"show"
    #render :text=>session[:current_user] and return
  end

end
