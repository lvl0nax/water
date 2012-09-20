class CreateQuickOrders < ActiveRecord::Migration
  def change
    create_table :quick_orders do |t|
      t.string :name
      t.string :company
      t.string :phone
      t.string :email
      t.string :watertype
      t.string :volume
      t.integer :count
      t.string :time
      t.string :address
      t.text :comment

      t.timestamps
    end
  end
end
