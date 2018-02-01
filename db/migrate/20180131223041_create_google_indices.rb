class CreateGoogleIndices < ActiveRecord::Migration[5.1]
  def change
    create_table :google_indices do |t|
      t.string :keyword
      t.string :site
      t.integer :keyposition
      t.integer :siteposition

      t.timestamps
    end
  end
end
