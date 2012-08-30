class Specoffer < ActiveRecord::Base
	mount_uploader :photo, PhotoUploader
end
