class AddFieldTitleToText < ActiveRecord::Migration
  def change
    add_column :helptexts, :title, :string
  end
end
