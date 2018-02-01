class AddDateTimeToGoogleIndex < ActiveRecord::Migration[5.1]
  def change
    change_column:google_indices, :created_at, :datetime, :null => false
  end
end
