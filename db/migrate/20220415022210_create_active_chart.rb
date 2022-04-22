class CreateActiveChart < ActiveRecord::Migration[7.0]
  def change
    create_table :active_charts do |t|
      t.integer :user_id
      t.datetime :active_time

      t.timestamps
    end
  end
end
