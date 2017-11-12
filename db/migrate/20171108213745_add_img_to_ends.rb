class AddImgToEnds < ActiveRecord::Migration[5.1]
  def change
  	add_column :ends, :img, :string
  	add_column :ends, :family, :string
  end
end
