class Waterbottle < ActiveRecord::Base
	has_many :costs
	mount_uploader :photo, PhotoUploader
end
