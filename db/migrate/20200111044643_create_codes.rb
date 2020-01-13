class CreateCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :codes do |t|
    	t.integer :casual_id
    	t.integer :office_id
    	t.integer :mode_id
    	t.integer :feminine_id

      t.timestamps
    end
  end
end
