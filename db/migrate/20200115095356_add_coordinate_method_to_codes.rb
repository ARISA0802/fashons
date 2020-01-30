class AddCoordinateMethodToCodes < ActiveRecord::Migration[5.2]
  def change
    add_column :codes, :coordinate_method, :string
  end
end
