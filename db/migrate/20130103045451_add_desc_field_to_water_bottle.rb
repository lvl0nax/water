class AddDescFieldToWaterBottle < ActiveRecord::Migration
  def change
  	add_column :waterbottles, :tabledesc, :string
  end
end
