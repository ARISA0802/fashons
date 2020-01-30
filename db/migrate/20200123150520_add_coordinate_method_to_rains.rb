class AddCoordinateMethodToRains < ActiveRecord::Migration[5.2]
  def change
    add_column :rains, :coordinate_method, :string
  end
end
