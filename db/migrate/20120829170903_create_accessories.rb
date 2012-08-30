class CreateAccessories < ActiveRecord::Migration
  def change
    create_table :accessories do |t|
      t.string :seotitle
      t.text :seodesc
      t.string :seokeywords
      t.string :title
      t.text :description
      t.boolean :availability
      t.float :price
      t.string :photo

      t.timestamps
    end
  end
end
