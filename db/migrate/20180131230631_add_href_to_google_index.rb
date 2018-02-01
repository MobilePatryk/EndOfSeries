class AddHrefToGoogleIndex < ActiveRecord::Migration[5.1]
  def change
    add_column :google_indices, :href, :string
  end
end
