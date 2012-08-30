class CreateCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
      t.references :waterbottle
      t.integer :startcount
      t.integer :endcount
      t.float :price
      t.boolean :corporate, :default => false
      t.boolean :individual, :default => true
      
      t.timestamps
    end
    add_index :costs, :waterbottle_id
  end
end
