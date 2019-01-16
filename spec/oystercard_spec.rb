require 'oystercard'

describe Oystercard do
  let(:station) { double :station }

  it 'has default max balance' do
    expect(subject.max_balance).to eq Oystercard::DEFAULT_MAX
  end

  it 'instantiates with empty array' do
    expect(subject.journeys).to eq []
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
      subject.instance_variable_set(:@journeys, [{}])
      subject.touch_out(5, station)
      expect(subject.balance).to eq 15
    end
  end

  describe '#in_journey' do
    context 'when card initialized' do
      it 'should return false' do
        expect(subject).not_to be_in_journey
      end
    end
  end

  describe '#touch_in' do
    context 'when balance equal to the default minimum' do
      before do
        subject.instance_variable_set(:@balance, Oystercard::DEFAULT_MIN)
      end
    end

    context 'with balance 0' do
      it 'should not allow touching in' do
        expect { subject.touch_in('Station') }.to raise_error 'Insufficient balance'
      end
    end
  end

  describe '#touch_out' do
    context 'when a journey has been started' do
      before do
        subject.instance_variable_set(:@journeys, [{}])
      end
    end

    context 'when a journey is complete' do
      it 'should store the journey' do
        subject.instance_variable_set(:@journeys, [{}])
        subject.touch_out(1, station)
        expect(subject.journeys[0][:exit_station]).to eq station
      end
    end

    context 'when balance is 1 or more' do
      it 'should deduct the amount from the balance' do
        subject.instance_variable_set(:@journeys, [{}])
        subject.instance_variable_set(:@balance, Oystercard::DEFAULT_MIN)
        expect { subject.touch_out(5, station) }.to change{ subject.balance }.by(-5)
      end
    end

    context 'when a second journey is completed' do
      # new oyster
      # user touches in at 1 and out 2
      # user touches in at 3 and out 4
      # expect journeys to be [{entry: 1, exit: 2}, {entry: 3, exit: 4}]
      it 'will store that journey after the first' do # TEST IS WRONG MAKE IT DO THE ABOVE AND RENAME
        subject.instance_variable_set(:@journeys, [{}])
        subject.instance_variable_set(:@balance, 1)
        subject.touch_in(station)
        subject.touch_out(1, station)
        expect(subject.journeys).to eq [{}, { entry: station, exit_station: station }]
      end
    end
  end
end
