require_relative 'journey.rb'

# Is oystercard
class Oystercard
  attr_reader :balance, :max_balance, :in_journey, :journeys, :entry, :exit_station

  DEFAULT_MAX = 90
  DEFAULT_MIN = 1

  def initialize
    @balance = 0
    @max_balance = DEFAULT_MAX
    @journeys = []
    #@entry = nil
    #@exit_station = nil
  end

  def topup(amount)
    raise "Max balance is #{max_balance}" if amount + balance >= max_balance

    @balance += amount
  end

  def touch_in(station)
    raise 'Insufficient balance' unless sufficient_balance?

    #@entry = station
    @journeys << { entry: station }
  end

  def touch_out(amount, station)
    deduct(amount)
    #@exit_station = station
    @journeys.last[:exit_station] = station
    #@entry = nil
  end

  def in_journey?
    @journeys.empty? ? false : @journeys.last.has_key?(:entry)
  end

  private

  def sufficient_balance?
    balance >= DEFAULT_MIN
  end

  def deduct(amount)
    @balance -= amount
  end
end
