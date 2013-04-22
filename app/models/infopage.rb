class Infopage < ActiveRecord::Base
  has_many :childrens, :class_name => "Infopage", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Infopage"

  validates :title, :description, :url, presence: true

  def to_param
  	url
  end
end
