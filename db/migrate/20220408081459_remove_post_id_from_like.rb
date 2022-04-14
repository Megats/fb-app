class RemovePostIdFromLike < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :post_id, :integer
    remove_column :likes, :comment_id, :integer
  end
end
