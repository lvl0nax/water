class CreateOvodes < ActiveRecord::Migration
  def change
    create_table :ovodes do |t|
      t.string :seotitle
      t.text :seodesc
      t.string :seokeywords
      t.string :title
      t.text :description
      t.boolean :top
      t.integer :column
      t.string :tag
      t.string :h1
      t.string :url

      t.timestamps
    end
  end
end
