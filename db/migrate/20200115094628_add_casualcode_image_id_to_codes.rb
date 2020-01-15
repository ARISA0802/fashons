class AddCasualcodeImageIdToCodes < ActiveRecord::Migration[5.2]
  def change
    add_column :codes, :casualcode_image_id, :string
  end
end
