# == Schema Information
#
# Table name: instagram_images
#
#  __typename                    :string
#  comments_disabled             :boolean
#  created_at                    :datetime         not null
#  dimensions_height             :integer
#  dimensions_width              :integer
#  display_url                   :string
#  edge_media_preview_like_count :integer
#  edge_media_to_caption         :string
#  edge_media_to_comment_count   :integer
#  id                            :integer          not null, primary key
#  instagram_post_id             :string
#  is_video                      :boolean
#  owner                         :string
#  shortcode                     :string
#  taken_at_timestamp            :datetime
#  thumbnail_resources_150       :string
#  thumbnail_resources_240       :string
#  thumbnail_resources_320       :string
#  thumbnail_resources_480       :string
#  thumbnail_resources_640       :string
#  thumbnail_src                 :string
#  updated_at                    :datetime         not null
#

class InstagramImage < ApplicationRecord
end
