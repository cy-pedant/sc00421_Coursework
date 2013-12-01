class PopulateBookings < ActiveRecord::Migration
  def change
    todayDate = Time.now.to_date
    for i in 0..9
      booking = Booking.create(lawn1: false, lawn2: false, lawn3: false, day: todayDate.next_day(i))
    end
  end
end
