class DeleteOuathExpiressAtInUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :oauth_expires_at
  end
end
