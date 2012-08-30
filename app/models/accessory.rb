class Accessory < ActiveRecord::Base
	mount_uploader :photo, PhotoUploader
end
