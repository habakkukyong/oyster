class Journey
  attr_reader :start_station, :finish_station

  def initialize(start_station = nil)
    @start_station = start_station
  end

  def finish(station)
    @finish_station = station
  end
end
