class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.boolean :lawn1
      t.boolean :lawn2
      t.boolean :lawn3
      t.date :day

      t.timestamps
    end
  end
end
