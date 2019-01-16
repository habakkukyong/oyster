class Journey
  attr_reader :start_station, :finish_station, :in_journey, :exit_station

  def initialize(start_station = nil)
    @start_station = start_station
    @in_journey = false
  end

  def receive_touch_in(station)
    @start_station = station
    @in_journey = true
  end

  def receive_touch_out(station)
    @exit_station = station
    @in_journey = false
  end
end
