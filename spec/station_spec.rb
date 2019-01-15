require 'station'
describe Station do
  let(:southwark) { Station.new('Southwark', 1) }
  it 'initializes with a name' do
    expect(southwark.name).to eq 'Southwark'
  end
  it 'initializes with a zone' do
    expect(southwark.zone).to eq 1
  end
end
