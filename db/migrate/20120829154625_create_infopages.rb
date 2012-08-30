class CreateInfopages < ActiveRecord::Migration
  def change
    create_table :infopages do |t|
      t.string :seotitle
      t.text :seodesc
      t.string :seokeywords
      t.string :title
      t.text :description
      t.boolean :top
      t.integer :column
      t.references :category

      t.timestamps
    end
    add_index :infopages, :category_id
  end
end
