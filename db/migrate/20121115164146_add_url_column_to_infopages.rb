class AddUrlColumnToInfopages < ActiveRecord::Migration
  def change
    add_column :infopages, :url, :string

  end
end
