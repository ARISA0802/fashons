class AddPostImageIdToTopixes < ActiveRecord::Migration[5.2]
  def change
    add_column :topixes, :post_image_id, :string
  end
end
