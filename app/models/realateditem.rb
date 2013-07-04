class Realateditem < ActiveRecord::Base
  attr_accessible :description, :price, :volume, :seokeywords,
                  :seotitle, :seodesc, :title, :photo

  validates :title, :price, :description, presence: true

  mount_uploader :photo, PhotoUploader
end
