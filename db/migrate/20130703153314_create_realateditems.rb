class CreateRealateditems < ActiveRecord::Migration
  def change
    create_table :realateditems do |t|
      t.string :seotitle
      t.text :seodesc
      t.string :seokeywords
      t.string :title
      t.string :volume
      t.text :description
      t.decimal :price, precision: 8, scale: 2
      t.string :photo

      t.timestamps
    end
  end
end
