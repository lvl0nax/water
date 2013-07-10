class AddCountFieldToRelatedItem < ActiveRecord::Migration
  def change
    add_column :realateditems, :number, :integer
  end
end
