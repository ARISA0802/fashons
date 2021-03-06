class CreateRains < ActiveRecord::Migration[5.2]
  def change
    create_table :rains do |t|
    	t.string :rain_image_id
    	t.string :name
    	t.string :cloudy_image_id
    	t.integer :user_id
    	t.text :introduction
        t.string :sunnyname
        t.string :sunnyintroduction
        t.string :sunny_image_id
    	t.timestamps
    end
  end
end
