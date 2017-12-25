class ImageViewerController < ApplicationController
  def index
    @images = InstagramImage.order(:taken_at_timestamp).page params[:page]
  end

  def show
    @image = InstagramImage.where(shortcode: params[:shortcode]).first
    if @image.nil?
      render text: "No way jose"
    end
  end
end
