require 'rubygems'
require 'flickraw'

  FlickRaw.api_key="d034e7a467967b7624b037b8a73050c4"
  FlickRaw.shared_secret="879cbcfe38123374"

  #puts flickr.auth.oauth.getAccessToken
  puts frob = flickr.auth.getFrob
  auth_url = FlickRaw.auth_url :frob => frob, :perms => 'write'
  
  puts "Open this url in your process to complete the authication process : #{auth_url}"
  puts "Press Enter when you are finished."
  STDIN.getc

  begin
    auth = flickr.auth.getToken :frob => frob
    login = flickr.test.login
    puts "You are now authenticated as #{login.username} with token #{auth.token}"
  rescue FlickRaw::FailedResponse => e
    puts "Authentication failed : #{e.msg}"
  end
