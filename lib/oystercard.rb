class Oystercard
  attr_reader :balance, :max_balance, :in_journey, :journeys

  DEFAULT_MAX = 90
  DEFAULT_MIN = 1

  def initialize
    @balance = 0
    @max_balance = DEFAULT_MAX
    @in_journey = false
    @journeys =[]
  end

  def topup(amount)
    amount + balance < max_balance ? @balance += amount : (raise "Max balance is #{max_balance}")
  end

  def touch_in(station)
    @balance >= DEFAULT_MIN ? @in_journey = true : (raise 'Insufficient balance')
    record_new_journey(station)
  end

  def record_new_journey(station)
    @journeys << Journey.new(station)
  end

  def touch_out(amount)
    @in_journey = false
    deduct(amount)
  end

  def in_journey?
    @in_journey
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
