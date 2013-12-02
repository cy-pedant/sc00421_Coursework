module BookingHelper

  # Reset the entries i a given row of the table
  def reset_row(row_no)
    date = Booking.find(row_no)
    date.lawn1 = false
    date.lawn2 = false
    date.lawn3 = false
    date.save
  end
  
  # Reset the Bookings table
  def reset_bookings
    for i in 1..10 do
      reset_row(i)
    end
  end
  
  # Update the table for the number of days missed
  def update_table
    first_day = Booking.find(1).day
    today = Date.today
    if (first_day != today) then
      days_out_of_date = 0;
      while (first_day != today) do
        first_day = first_day.next
        days_out_of_date += 1;
      end
      if (days_out_of_date >= 10) then
        for i in 1..10 do
          date = Booking.find(i)
          date.lawn1 = false
          date.lawn2 = false
          date.lawn3 = false
          date.day = today.next_day(i-1)
          date.save
        end
      else
        rows_to_keep = 10 - days_out_of_date
        for i in 1..rows_to_keep do
          current_date = Booking.find(i)
          next_date = Booking.find(i + days_out_of_date)
          current_date.lawn1 = next_date.lawn1
          current_date.lawn2 = next_date.lawn2
          current_date.lawn3 = next_date.lawn3
          current_date.day = next_date.day
          current_date.save
        end
        for i in (row1_to_keep + 1)..10 do
          date = Booking.find(i)
          date.lawn1 = false
          date.lawn2 = false
          date.lawn3 = false
          date.day = today.next_day(i-1)
          date.save
        end
      end
    end
  end
        
end
