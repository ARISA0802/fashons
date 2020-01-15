class AddOfficecodeImageIdToCodes < ActiveRecord::Migration[5.2]
  def change
    add_column :codes, :officecode_image_id, :string
  end
end
