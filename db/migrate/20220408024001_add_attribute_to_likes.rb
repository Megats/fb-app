class AddAttributeToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :post_id, :integer
    add_column :likes, :comment_id, :integer
    add_column :likes, :user_id, :integer
  end
end
