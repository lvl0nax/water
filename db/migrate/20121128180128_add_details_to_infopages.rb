class AddDetailsToInfopages < ActiveRecord::Migration
  def change
    add_column :infopages, :lft, :integer
    add_column :infopages, :rgt, :integer
    add_column :infopages, :parent_id, :integer
    add_column :infopages, :depth, :integer
  end
end
