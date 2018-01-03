class ChangeDataTypeInUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :oauth_expires_at, :date
  end
end
