class Oystercard
  attr_reader :balance, :max_balance, :in_journey

  DEFAULT_MAX = 90

  def initialize
    @balance = 0
    @max_balance = DEFAULT_MAX
    @in_journey = false
  end

  def topup(amount)
    amount + balance < max_balance ? @balance += amount : (raise "Max balance is #{max_balance}")
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end
end
