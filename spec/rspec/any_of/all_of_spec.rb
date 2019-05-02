RSpec.describe RSpec::AnyOf, '#all_of' do
  let(:receiver) { double(:receiver) }

  it 'passes if method is called with all required arguments' do
    expect(receiver).to receive(:something).with(all_of(1, 2)).twice
    receiver.something(1)
    receiver.something(2)
  end

  it 'fails if method is not called with one of the required arguments', :reset do
    expect(receiver).to receive(:something).with(all_of(1, 2)).twice
    expect do
      receiver.something(1)
      receiver.something(3)
    end
      .to fail_with('unexpected arguments')
  end

  it 'fails if method is called twice with one of required arguments, but not the other', :reset do
    expect(receiver).to receive(:something).with(all_of(1, 2)).twice
    expect do
      receiver.something(1)
      receiver.something(1)
    end
      .to fail_with('unexpected arguments')
  end
end
