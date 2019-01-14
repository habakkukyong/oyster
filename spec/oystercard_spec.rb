require 'oystercard'

describe Oystercard do
  it 'should return balance is 0' do
    expect(subject.balance).to eq 0
  end
end
