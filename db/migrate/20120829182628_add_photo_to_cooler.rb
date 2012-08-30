class AddPhotoToCooler < ActiveRecord::Migration
  def change
  	add_column :coolers, :photo, :string
  end
end
