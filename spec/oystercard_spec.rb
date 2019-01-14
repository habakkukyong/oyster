require 'oystercard'

describe Oystercard do
  it 'has default max balance of 90' do
    expect(Oystercard::DEFAULT_MAX).to eq 90
  end

  describe '#topup' do
    it 'should increase balance by an amount' do
      subject.topup(10)
      expect(subject.balance).to eq 10
    end

    it 'should raise when error when topping up by more than the maximum' do
      expect { subject.topup(91) }.to raise_error "Max balance is 90"
    end
  end
end
