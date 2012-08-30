class CreateSpecoffers < ActiveRecord::Migration
  def change
    create_table :specoffers do |t|
      t.string :seotitle
      t.text :seodesc
      t.string :seokeywords
      t.string :title
      t.text :shortdesc
      t.text :description
      t.string :photo

      t.timestamps
    end
  end
end
