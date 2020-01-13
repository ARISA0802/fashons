class CreateFeminines < ActiveRecord::Migration[5.2]
  def change
    create_table :feminines do |t|
    	t.string :name
    	t.string :femininecode_image_id

      t.timestamps
    end
  end
end
