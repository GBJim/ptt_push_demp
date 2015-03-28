class CreatePushes < ActiveRecord::Migration
  def change
    create_table :pushes do |t|
      t.text :body
      t.string :user_id

      t.timestamps
    end
  end
end
