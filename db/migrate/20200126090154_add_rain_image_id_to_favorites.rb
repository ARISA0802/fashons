class AddRainImageIdToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :rain_image_id, :string
  end
end
