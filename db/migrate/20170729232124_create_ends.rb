class CreateEnds < ActiveRecord::Migration[5.1]
  def change
    create_table :ends do |t|
      t.integer :product_id
      t.integer :product_page
      t.integer :position

      t.timestamps
    end
  end
end
