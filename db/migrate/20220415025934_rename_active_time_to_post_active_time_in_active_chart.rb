class RenameActiveTimeToPostActiveTimeInActiveChart < ActiveRecord::Migration[7.0]
  def change
      rename_column :active_charts, :active_time, :post_activetime
  end
end
