class AddEmailImageToProducts < ActiveRecord::Migration
  def change
      add_column :products, :email_image, :string
  end
end
