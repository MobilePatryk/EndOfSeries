class AddSomeToUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :oauth_expires_at, :datetime
    add_column :users, :test, :string
  end
end
