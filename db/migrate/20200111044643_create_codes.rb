class CreateCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :codes do |t|
    	t.integer :casual_id
    	t.integer :office_id
    	t.integer :mode_id
    	t.integer :feminine_id
    	t.string  :officecode_image_id
    	t.string :femininecode_image_id
    	t.string :casualcode_image_id
    	t.string :modecode_image_id
      t.string :code_image_id
      t.timestamps
    end
  end
end
