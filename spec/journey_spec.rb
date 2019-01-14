require 'journey'

describe Journey do
  it 'should should inititalize with start station' do
    journey = Journey.new("StartStation")
    expect(journey.start).to eq "StartStation"
  end
end
