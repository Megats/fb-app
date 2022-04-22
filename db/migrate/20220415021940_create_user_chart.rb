class CreateUserChart < ActiveRecord::Migration[7.0]
  def change
    create_table :user_charts do |t|
      t.text :user_name

      t.timestamps
    end
  end
end
