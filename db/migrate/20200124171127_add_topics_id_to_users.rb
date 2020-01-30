class AddTopicsIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :topics_id, :integer
  end
end
