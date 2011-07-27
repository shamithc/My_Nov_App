module Authentication

  class Unauthorized < StandardError; end

  def self.included(base)
    base.send(:include, Authentication::HelperMethods)
    base.send(:include, Authentication::ControllerMethods)
  end

  module HelperMethods

    def current_user
      #@data=session[:fb_id] and return
      @current_user = Facebook.find_by_identifier(session[:fb_id]) #.to_yaml
    rescue ActiveRecord::RecordNotFound
      nil
    end

    def authenticated?
      #render :text => current_user
      !current_user.blank?
    end

  end

  module ControllerMethods

    def require_authentication
      authenticate Facebook.find_by_identifier(session[:fb_id]) #.inspect
    rescue Unauthorized => e
      redirect_to root_url and return false
    end

    def authenticate(user)
      raise Unauthorized unless user
      #render :text=>user.identifier
      #session[:current_user] = user.identifier
    end

    def unauthenticate
      current_user.destroy
      @current_user = session[:current_user] = nil
    end

  end

end
