class CreateScheduleDays < ActiveRecord::Migration
  def change
    create_table :schedule_days do |t|
      t.string :name
      t.references :product, index: true

      t.timestamps null: false
    end
    add_foreign_key :schedule_days, :products
  end
end
