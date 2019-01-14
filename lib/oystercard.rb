class Oystercard
  attr_reader :balance, :max_balance

  DEFAULT_MAX = 90

  def initialize
    @balance = 0
    @max_balance = DEFAULT_MAX
  end

  def topup(amount)
    amount + balance < max_balance ? @balance += amount : (raise "Max balance is #{max_balance}")
  end

  def deduct(amount)
    @balance -= amount
  end
end
