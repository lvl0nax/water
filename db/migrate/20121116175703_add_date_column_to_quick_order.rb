class AddDateColumnToQuickOrder < ActiveRecord::Migration
  def change
    add_column :quick_orders, :date, :date

  end
end
