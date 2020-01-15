class AddFemininecodeImageIdToCodes < ActiveRecord::Migration[5.2]
  def change
    add_column :codes, :femininecode_image_id, :string
  end
end
