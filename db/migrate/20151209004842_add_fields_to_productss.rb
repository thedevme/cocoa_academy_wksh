class AddFieldsToProductss < ActiveRecord::Migration
  def change
      add_column :products, :product_thumb_image, :string
      add_column :products, :location, :string
      add_column :products, :city, :string
      add_column :products, :date, :string
  end
end
