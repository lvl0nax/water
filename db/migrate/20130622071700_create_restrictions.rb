class CreateRestrictions < ActiveRecord::Migration
  def change
    create_table :restrictions do |t|
      t.string :title
      t.string :days

      t.timestamps
    end
  end
end
