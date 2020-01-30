class AddSunnyImageIdToRains < ActiveRecord::Migration[5.2]
  def change
    add_column :rains, :sunny_image_id, :string
  end
end
