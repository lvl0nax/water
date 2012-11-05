class Waterbottle < ActiveRecord::Base
	has_many :costs
	mount_uploader :photo, PhotoUploader
	attr_accessible :photo, :name, :seotitle, :seodesc, :seokeywords, :title, :description, :maker, :volume, :corporatedesc, :individualdesc
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
