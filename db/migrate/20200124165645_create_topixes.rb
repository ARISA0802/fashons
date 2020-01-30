class CreateTopixes < ActiveRecord::Migration[5.2]
  def change
    create_table :topixes do |t|
      t.string :title
      t.string :body
      t.timestamps
    end
  end
end
