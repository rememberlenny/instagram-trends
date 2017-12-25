class CreateInstagramImages < ActiveRecord::Migration[5.1]
  def change
    create_table :instagram_images do |t|
      t.string :instagram_post_id
      t.string :__typename
      t.string :edge_media_to_caption
      t.string :shortcode
      t.integer :edge_media_to_comment_count
      t.boolean :comments_disabled
      t.datetime :taken_at_timestamp
      t.string :dimensions_width
      t.string :dimensions_height
      t.string :display_url
      t.integer :edge_media_preview_like_count
      t.string :owner
      t.string :thumbnail_src
      t.string :thumbnail_resources_150
      t.string :thumbnail_resources_240
      t.string :thumbnail_resources_320
      t.string :thumbnail_resources_480
      t.string :thumbnail_resources_640
      t.boolean :is_video

      t.timestamps
    end
  end
end
