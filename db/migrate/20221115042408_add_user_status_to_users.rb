class AddUserStatusToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :user_status, :boolean, default: true
  end
end
