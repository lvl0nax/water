class Banner < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  attr_accessible :image, :name
end
