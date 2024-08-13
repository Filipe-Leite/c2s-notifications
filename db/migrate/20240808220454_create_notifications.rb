class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.string :description
      t.integer :user_id
      t.string :email
      t.integer :task_id
      t.references :product, null: true, foreign_key: true

      t.timestamps
    end
  end
end
