class AddColumnToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :created_at, :datetime, null: false
  end
end
