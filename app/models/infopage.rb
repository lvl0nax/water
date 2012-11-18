class Infopage < ActiveRecord::Base
  belongs_to :category

  def to_param
  	url
  end
end
