class CreateHelptexts < ActiveRecord::Migration
  def change
    create_table :helptexts do |t|
      t.string :tag
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
