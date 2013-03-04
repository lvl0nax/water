class CreateShoppingCarts < ActiveRecord::Migration
  def change
    create_table :shopping_carts do |t|
      t.string :name
      t.string :company
      t.string :phone
      t.string :email
      t.string :time
      t.string :address
      t.text :comment
      t.timestamps
    end
  end
end
