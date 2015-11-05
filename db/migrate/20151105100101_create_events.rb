class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :event_date
      t.string :location
      t.string :description

      t.timestamps null: false
    end
  end
end
