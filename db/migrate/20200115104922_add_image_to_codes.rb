class AddImageToCodes < ActiveRecord::Migration[5.2]
  def change
    add_column :codes, :img, :string
  end
end
