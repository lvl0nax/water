class Infopage < ActiveRecord::Base
<<<<<<< HEAD
  has_many :childrens, :class_name => "Infopage", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Infopage"

=======
	acts_as_nested_set
	include TheSortableTree::Scopes
  belongs_to :category
  
>>>>>>> 0bcb721c424cc0d49ecb9bdae27a278ceca8cd08
  def to_param
  	url
  end
end
