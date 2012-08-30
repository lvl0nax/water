class CreateNewspages < ActiveRecord::Migration
  def change
    create_table :newspages do |t|
      t.string :seotitle
      t.text :seodesc
      t.string :seokeywords
      t.string :title
      t.text :short_desc
      t.text :description

      t.timestamps
    end
  end
end
