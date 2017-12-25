require 'test_helper'

class ImageViewerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get image_viewer_index_url
    assert_response :success
  end

  test "should get show" do
    get image_viewer_show_url
    assert_response :success
  end

end
