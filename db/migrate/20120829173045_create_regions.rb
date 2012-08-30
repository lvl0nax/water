class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :seotitle
      t.text :seodesc
      t.string :seokeywords
      t.string :title
      t.text :description
      t.boolean :mon
      t.boolean :tue
      t.boolean :wed
      t.boolean :thu
      t.boolean :fri
      t.boolean :sat
      t.boolean :sun

      t.timestamps
    end
  end
end
