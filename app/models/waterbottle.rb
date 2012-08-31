class Waterbottle < ActiveRecord::Base
	has_many :costs
	mount_uploader :photo, PhotoUploader
	attr_accessible :name
	def name
		self.title + " - " + self.volume.to_s
	end

	def icosts
		self.costs.where(:individual=>true)
	end
	def ccosts
    	self.costs.where(:corporate=>true)
    end
end
