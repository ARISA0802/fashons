class AddSunnyintroductionToRains < ActiveRecord::Migration[5.2]
  def change
    add_column :rains, :sunnyintroduction, :text
  end
end
