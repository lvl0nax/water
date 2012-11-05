class TinymceAssetsController < ApplicationController
  # respond_to :json

  # def create
  #   authorize! :create, TinymceAsset # Use CanCan for authorization

  #   geometry     = Paperclip::Geometry.from_file params[:file]
  #   image        = TinymceAsset.new
  #   image.file   = params[:file]
  #   image.width  = geometry.width.to_i
  #   image.height = geometry.height.to_i
  #   image.save!

  #   render json: {
  #     image: {
  #       url:    view_context.gridfs_url(image.file),
  #       height: image.height,
  #       width:  image.width
  #     }
  #   }, layout: false, content_type: "text/html"
  # end
end