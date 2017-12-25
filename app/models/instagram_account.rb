class InstagramAccount

  def self.pull_next_images(url)
    puts "Getting images from #{url}"
    response = HTTParty.get(url)
    # InstagramAccount.process_response(response)
    InstagramAccount.delay.process_response(response)
  end

  def self.process_response(response)
    if response["posts"]
      if !response["next"].nil?
        next_url = response["next"]
        # InstagramAccount.pull_next_images(next_url)
        InstagramAccount.delay.pull_next_images(next_url)
      end

      if response["posts"].count > 0
        puts "Pulled in response with #{response["posts"].count} results"
        response["posts"].each do |post|
          # InstagramAccount.process_post_image(post)
          InstagramAccount.delay.process_post_image(post)
        end
      else
        puts "Pulled in response with no results"
      end
    else
      puts "Theres an issue an no posts contained in response."
    end
  end

  def self.process_post_image(post)
    puts "Accessing post from instagram #{post["shortcode"]}"
    # Storing the images starts here
    params = {}
    params["__typename"] = post["__typename"]
    params["comments_disabled"] = post["comments_disabled"]
    params["dimensions_height"] = post["dimensions"]["height"]
    params["dimensions_width"] = post["dimensions"]["width"]
    params["display_url"] = post["display_url"]
    params["edge_media_preview_like_count"] = post["edge_media_preview_like"]["count"]
    if post["edge_media_to_caption"]["edges"].count > 0
      params["edge_media_to_caption"] = post["edge_media_to_caption"]["edges"][0]["node"]["text"]
    end
    params["edge_media_to_comment_count"] = post["edge_media_to_comment"]["count"]
    params["instagram_post_id"] = post["id"]
    params["is_video"] = post["is_video"]
    params["owner"] = post["owner"]["id"]
    params["shortcode"] = post["shortcode"]
    params["taken_at_timestamp"] = post["taken_at_timestamp"]
    post["thumbnail_resources"].each do |size|
      if size["config_width"] == 150
        params["thumbnail_resources_150"] = size["src"]
      elsif size["config_width"] == 240
        params["thumbnail_resources_240"] = size["src"]
      elsif size["config_width"] == 320
        params["thumbnail_resources_320"] = size["src"]
      elsif size["config_width"] == 480
        params["thumbnail_resources_480"] = size["src"]
      elsif size["config_width"] == 640
        params["thumbnail_resources_640"] = size["src"]
      end
    end
    params["thumbnail_src"] = post["thumbnail_src"]
    InstagramImage.create(params)
  end

  # Starting point for pull_user_images aka. init
  def self.pull_user_images(user_id)
    puts "Kicking off the party"
    url = "https://graffiti-instagram-trend.herokuapp.com/graphql/query/?user_id=#{user_id}&count=25"
    # InstagramAccount.pull_next_images(url)
    InstagramAccount.delay.pull_next_images(url)
  end
end