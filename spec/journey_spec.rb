require 'journey'

describe Journey do
  let(:station) { double :station }

  it 'should intialize with start defaulting to nil' do
    expect(subject.start_station).to eq nil
  end

  it 'should intialize with finish_station defaulting to nil' do
    expect(subject.finish_station).to eq nil
  end

  describe '#receive_touch_in' do
    context 'when told where the user has touched in' do
      let(:recipient_journey) { Journey.new }
      before do
        recipient_journey.receive_touch_in(station)
      end
      it 'sets the start of the journey to that station' do
        expect(recipient_journey.start_station).to eq station
      end

      it 'should update in journey to true' do
        expect(recipient_journey.in_journey).to eq true
      end
    end
  end

  describe '#receive_touch_out' do
    context 'when told where the user has touched in' do
      let(:recipient_journey) { Journey.new }
      before do
        recipient_journey.receive_touch_out(station)
      end
      it 'sets the end of the journey to that station' do
        expect(recipient_journey.exit_station).to eq station
      end

      it 'should update in journey to false' do
        expect(recipient_journey.in_journey).to eq false
      end
    end
  end
end
