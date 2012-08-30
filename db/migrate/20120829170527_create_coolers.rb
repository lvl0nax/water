class CreateCoolers < ActiveRecord::Migration
  def change
    create_table :coolers do |t|
      t.string :seotitle
      t.text :seodesc
      t.string :seokeywords
      t.string :title
      t.text :description
      t.string :constructiontype
      t.string :coolingtype
      t.float :heatingtime
      t.integer :heatingpower
      t.float :coolingtime
      t.integer :coolingtemprature
      t.integer :coolingpower
      t.integer :width
      t.integer :height
      t.integer :long
      t.string :feature
      t.float :price

      t.timestamps
    end
  end
end
