class AddDateToShoppingCarts < ActiveRecord::Migration
  def change
    add_column :shopping_carts, :date, :date
  end
end
