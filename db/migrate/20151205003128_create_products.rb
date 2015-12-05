class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :subtitle
      t.text :description
      t.string :sku
      t.decimal :price
      t.string :product_image
      t.string :details

      t.timestamps null: false
    end
  end
end
