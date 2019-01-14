require 'oystercard'

describe Oystercard do

  let(:journey) { double :journey }
  let(:station) { double :station }

  it 'has default max balance of 90' do
    expect(Oystercard::DEFAULT_MAX).to eq 90
  end

  describe '#topup' do
    it 'should increase balance by an amount' do
      subject.topup(10)
      expect(subject.balance).to eq 10
    end

    it 'should raise when error when topping up by more than the maximum' do
      expect { subject.topup(Oystercard::DEFAULT_MAX + 1) }.to raise_error "Max balance is #{Oystercard::DEFAULT_MAX}"
    end
  end

  describe '#deduct' do
    it 'should deduct an amount from the balance' do
      subject.instance_variable_set(:@balance, 20)
      subject.touch_out(5)
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
      context 'when balance 1' do
        it 'should update in journey to true' do
          subject.instance_variable_set(:@balance, Oystercard::DEFAULT_MIN)
          subject.touch_in("Station")
          expect(subject.in_journey).to eq true
        end
        it 'should record the journey ID in journies array' do
          subject.record_new_journey(station)
          expect(subject.journeys.first.start).to eq station
        end
    end

    context "with balance 0" do
      it 'should not allow touching in' do
        expect { subject.touch_in("Station") }.to raise_error "Insufficient balance"
      end
    end
  end

    describe '#touch_out' do
      it 'should update in journey to false' do
        subject.touch_out(1)
        expect(subject.in_journey).to eq false
      end

      context 'when balance is 1 or more' do
        it 'should deduct the amount from the balance' do
          subject.instance_variable_set(:@balance, Oystercard::DEFAULT_MIN)
          expect {subject.touch_out(5)}.to change{subject.balance}.by(-5)
        end
      end
    end
end
