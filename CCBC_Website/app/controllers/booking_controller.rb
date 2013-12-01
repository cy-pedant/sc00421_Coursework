require 'messenger/sse'

class BookingController < ApplicationController
  include ActionController::Live
  
  
  def index
    @title = "Book a Lawn"
    @days = Booking.all
    # Here's where the updating action would go
    # update_table
  end

  def show
    @title = "Book a Lawn"
    @days = Booking.all
    # update_table
  end
  
  def source
    response.headers['Content-Type'] = 'text/event-stream'
    
    sse = Messenger::SSE.new(response.stream)
    
    begin
      loop do
        Booking.uncached do
          for i in 1..10
            @thisDay = Booking.find(i)
            sse.write({:day => i, :lawn1booked => @thisDay.lawn1, :lawn2booked => @thisDay.lawn2, :lawn3booked => @thisDay.lawn3}, :event => "update")
            sleep 0.2
          end
        end
      end
    rescue
      # when client disconnects, we'll get an IOError on write
    ensure
      sse.close
    end
  end

  def book1
    @date = Booking.find(params[:id])
    @date.lawn1 = true
    @date.save
    redirect_to controller: "booking", action: "show", id: params[:id]
  end

  def book2
    @date = Booking.find(params[:id])
    @date.lawn2 = true
    @date.save
    redirect_to controller: "booking", action: "show", id: params[:id]
  end

  def book3
    @date = Booking.find(params[:id])
    @date.lawn3 = true
    @date.save
    redirect_to controller: "booking", action: "show", id: params[:id]
  end
    
  def reset_all
    reset_table
    redirect_to booking_path
  end
    
  private
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
      if (first_day != Time.now.to_date) then
        days_out_of_date = 0;
        while (first_day != Time.now.to_date) do
          days_out_of_date += 1;
        end
        if (days_out_of_date >= 10) then
          reset_table
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
            reset_row(i)
          end
        end
      end
    end
    
end
