class CcbcCoreController < ApplicationController
  def Home
    @title = "Home"
  end

  def About
    @title = "About the Club"
  end

  def Join
    @title = "How to Join"
  end

  def Equip
    @title = "What you need"
  end
  
  def Programme
    @title = Time.now.year.to_s + " Programme"
    @events = Event.all.sort_by {|event| event.date}
  end

  def Newsletters
    @title = "Newsletters"
    @newsletters = Newsletter.all.sort_by {|newsletter| newsletter.date}
  end

  def Club
    @title = "Club Matters"
  end

  def Map
    @title = "How to get there"
  end
  
#  def Booking
#    @title = "Booking"
#  end

  def Links
    @title = "Links to Croquet Sites"
  end
end
