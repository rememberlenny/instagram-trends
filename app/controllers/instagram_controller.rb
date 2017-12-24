class InstagramController < ApplicationController
  before_action :set_instagram

  def login
    set_instagram
    redirect_to Instagram.authorize_url(:redirect_uri => ENV['INSTAGRAM_REDIRECT_URL'])
  end

  def store_session
    response = Instagram.get_access_token(params[:code], :redirect_uri => ENV['INSTAGRAM_REDIRECT_URL'])
    session[:INSTAGRAM_ACCESS_TOKEN] = response.access_token
    redirect_to root_path, alert: "Login worked. Access token #{session[:INSTAGRAM_ACCESS_TOKEN]}"
  end

  protected

  def set_instagram
    Instagram.configure do |config|
      config.client_id = ENV['INSTAGRAM_CLIENT_ID']
      config.client_secret = ENV['INSTAGRAM_CLIENT_SECRET']
      # For secured endpoints only
      #config.client_ips = '<Comma separated list of IPs>'
    end
  end
end
