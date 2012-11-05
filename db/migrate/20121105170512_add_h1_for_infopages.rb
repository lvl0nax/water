class AddH1ForInfopages < ActiveRecord::Migration
  def change
  	add_column :infopages, :h1, :string
  end
end
