class CreateCasuals < ActiveRecord::Migration[5.2]
  def change
    create_table :casuals do |t|
    	t.string :name
    	t.string :casualcode_image_id

      t.timestamps
    end
  end
end
