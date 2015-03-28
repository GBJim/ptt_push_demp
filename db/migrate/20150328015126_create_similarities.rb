class CreateSimilarities < ActiveRecord::Migration
  def change
    create_table :similarities do |t|
      t.float :score
      t.references :user, index: true
      t.string :partner
      t.integer :user_id

      t.timestamps
    end
  end
end
