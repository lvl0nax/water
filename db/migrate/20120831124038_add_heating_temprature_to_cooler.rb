class AddHeatingTempratureToCooler < ActiveRecord::Migration
  def change
  	add_column :coolers, :heatingtemprature, :integer
  end
end
