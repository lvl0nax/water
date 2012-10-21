class AddDayColumnToOrder < ActiveRecord::Migration
  def change
  	add_column :quick_orders, :day, :string
  end
end
