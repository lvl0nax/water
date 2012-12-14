class AddParentIdToInfopages < ActiveRecord::Migration
  def change
    add_column :infopages, :parent_id, :integer

  end
end
