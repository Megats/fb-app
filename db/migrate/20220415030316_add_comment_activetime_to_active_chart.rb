class AddCommentActivetimeToActiveChart < ActiveRecord::Migration[7.0]
  def change
    add_column :active_charts, :comment_activetime, :datetime
  end
end
