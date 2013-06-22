class AddColumntToRestriction < ActiveRecord::Migration
  def change
    add_column :restrictions, :name, :string
  end
end
