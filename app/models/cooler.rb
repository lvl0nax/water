class Cooler < ActiveRecord::Base
	mount_uploader :photo, PhotoUploader
  def name
    self.title
  end
end
