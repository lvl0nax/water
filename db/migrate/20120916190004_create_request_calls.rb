class CreateRequestCalls < ActiveRecord::Migration
  def change
    create_table :request_calls do |t|
      t.string :phone
      t.string :name
      t.string :comment

      t.timestamps
    end
  end
end
