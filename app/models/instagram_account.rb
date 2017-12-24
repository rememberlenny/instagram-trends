class InstagramAccount

  def pull_user_images(user_id)
    url = "https://api.instagram.com/v1/users/" + user_id + "/?access_token=" + session[:INSTAGRAM_ACCESS_TOKEN]
    response = HTTParty.get(url)

    # puts response.body, response.code, response.message, response.headers.inspect
    return response
  end

end