class AddMoreFieldsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :location_image, :string
    add_column :products, :location_address, :string
  end
end
