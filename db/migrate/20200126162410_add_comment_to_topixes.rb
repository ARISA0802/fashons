class AddCommentToTopixes < ActiveRecord::Migration[5.2]
  def change
    add_column :topixes, :comment, :text
  end
end
