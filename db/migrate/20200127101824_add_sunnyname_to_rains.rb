class AddSunnynameToRains < ActiveRecord::Migration[5.2]
  def change
    add_column :rains, :sunnyname, :string
  end
end
