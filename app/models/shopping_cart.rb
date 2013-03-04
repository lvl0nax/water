class ShoppingCart < ActiveRecord::Base
  # attr_accessible :title, :body
  acts_as_shopping_cart

  has_one :order
end
