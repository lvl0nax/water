class AddShortDescToCoolers < ActiveRecord::Migration
  def change
  	add_column :coolers, :shortdesc, :text
  end
end
