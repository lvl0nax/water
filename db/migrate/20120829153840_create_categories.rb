class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :seotitle
      t.text :seodesc
      t.string :seokeywords
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
