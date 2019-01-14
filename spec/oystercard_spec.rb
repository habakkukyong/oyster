require 'oystercard'

describe Oystercard do
  it 'should return balance is 0' do
    expect(subject.balance).to eq 0
  end
  describe '#top_up' do
    it 'should increase balance by an amount' do
      subject.top_up(10)
      expect(subject.balance).to eq 10
    end
  end
end
