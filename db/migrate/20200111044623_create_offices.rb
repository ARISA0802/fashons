class CreateOffices < ActiveRecord::Migration[5.2]
  def change
    create_table :offices do |t|
      t.string :name
      t.string :officecode_image_id
      t.timestamps
    end
  end
end
