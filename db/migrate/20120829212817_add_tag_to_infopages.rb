class AddTagToInfopages < ActiveRecord::Migration
  def change
  	add_column :infopages, :tag, :string
  end
end
