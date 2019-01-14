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

  describe '#deduct' do
    it 'should deduct an amount from the balance' do
      subject.instance_variable_set(:@balance, 20 )
      subject.deduct(5)
      expect(subject.balance).to eq 15
    end
  end

  describe '#in_journey' do
      it 'should return true' do
        expect(subject.in_journey).to eq false
      end
    end

    describe '#in_journey?' do
      it 'should return true' do
        expect(subject).to_not be_in_journey
      end
  end

    describe '#touch_in' do
      it 'should update in journey to true' do
        subject.touch_in
        expect(subject.in_journey).to eq true
      end
    end

    describe '#touch_out' do
      it 'should update in journey to false' do
        subject.touch_out
        expect(subject.in_journey).to eq false
      end
    end
end
