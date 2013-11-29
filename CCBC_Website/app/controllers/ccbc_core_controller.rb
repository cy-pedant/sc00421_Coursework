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
    @title = "2013 Programme"
  end

  def Newsletters
    @title = "Newsletters"
  end

  def Club
    @title = "Club Matters"
  end

  def Map
    @title = "How to get there"
  end
  
  def Booking
    @title = "Booking"
  end

  def Links
    @title = "Links to Croquet Sites"
  end
end
