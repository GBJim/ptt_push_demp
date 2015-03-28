class ChangeUserIdFormatInPush < ActiveRecord::Migration
  def change
  	change_column :pushes, :user_id, :integer
  end
end
