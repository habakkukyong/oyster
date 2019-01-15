require 'journey'

describe Journey do
  let(:station) { double :station }

  it 'should intialize with start defaulting to nil' do
    expect(subject.start_station).to eq nil
  end

  it 'should intialize with finish_station defaulting to nil' do
    expect(subject.finish_station).to eq nil
  end

  it 'can be initialized with a starting station' do
    expect(Journey.new(station).start_station).to eq station
  end

  describe '#finish' do
    it 'stores the finish station on the Journey' do
      subject.finish(station)
      expect(subject.finish_station).to eq station
    end
  end
end
