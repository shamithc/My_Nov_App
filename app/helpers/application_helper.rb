module ApplicationHelper
  include Authentication::HelperMethods

  def fb_graph_url
    'http://github.com/nov/fb_graph'
  end

  def fb_graph_sample_url
    'http://github.com/nov/fb_graph_sample'
  end

  def fb_authenticate?
    session[:fb_id].blank?
  end
 
  def fb_current_user
    @current_user = Facebook.find_by_identifier(session[:fb_id])    
  end
  
  def paginate(albums)
    #n="next"
    n=2
  
    #while(n>0)
    #n= n-1
    #"<%= link_to "add" %>---- "
    #end
    #album=albums.next
    #album.next.count
    
  end

end
