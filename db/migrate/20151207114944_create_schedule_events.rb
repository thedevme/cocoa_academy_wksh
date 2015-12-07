class CreateScheduleEvents < ActiveRecord::Migration
  def change
    create_table :schedule_events do |t|
      t.string :name
      t.string :description
      t.string :instructor
      t.time :start_time
      t.string :icon, default: "fa-clock-o"

      t.references :schedule_day, index: true

      t.timestamps null: false
    end
    add_foreign_key :schedule_events, :schedule_days
  end
end
