class ShoppingCartItem < ActiveRecord::Base
  # attr_accessible :title, :body
  acts_as_shopping_cart_item
end
