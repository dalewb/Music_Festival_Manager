class Booking < ApplicationRecord
  belongs_to :performance
  belongs_to :schedule
<<<<<<< HEAD

  validate :overlapping_time_for_performances

  def overlapping_time_for_performances
    #all bookings for specific instance of user
    self.schedule.bookings.each do |other_booking|
      if (start_time >= other_booking.end_time) && (end_time <= other_booking.start_time)
        redirect_to schedule_path
      else
        booking.errors.full_messages
      end
    end
=======
  delegate :artist, to: :performance
  delegate :stage, to: :performance
  delegate :start_time, to: :performance
  delegate :end_time, to: :performance
  validates :performance_id, uniqueness: true

  def artist_name
    self.artist.name
  end

  def stage_name
    self.stage.name
  end
>>>>>>> 164fd536b23cfdf58d3954fb10dbb32b5f61b76e

end
