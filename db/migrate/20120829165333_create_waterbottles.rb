class CreateWaterbottles < ActiveRecord::Migration
  def change
    create_table :waterbottles do |t|
      t.string :seotitle
      t.text :seodesc
      t.string :seokeywords
      t.string :title
      t.text :description
      t.string :maker
      t.float :volume
      t.text :corporatedesc
      t.text :individualdesc
      t.string :photo

      t.timestamps
    end
  end
end
