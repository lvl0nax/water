class ChangeTypeForQoField < ActiveRecord::Migration
  def change
    change_column :quick_orders, :volume, :text
  end
end
