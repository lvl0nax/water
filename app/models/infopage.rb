class Infopage < ActiveRecord::Base
	acts_as_nested_set
	include TheSortableTree::Scopes
  belongs_to :category
  
  def to_param
  	url
  end
end
