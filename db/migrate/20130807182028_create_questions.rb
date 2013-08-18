class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :title
      t.text :answer
      t.string :article

      t.timestamps
    end
  end
end
