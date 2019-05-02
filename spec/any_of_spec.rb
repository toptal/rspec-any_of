RSpec.describe 'any_of' do
  let(:receiver) { double(:receiver) }

  it 'passes if method is called with a first allowed argument' do
    expect(receiver).to receive(:something).with(any_of(1, 2))
    receiver.something(1)
  end

  it 'passes if method is called with another allowed argument' do
    expect(receiver).to receive(:something).with(any_of(1, 2))
    receiver.something(2)
  end

  it 'passes if method is called with all allowed arguments' do
    expect(receiver).to receive(:something).with(any_of(1, 2)).twice
    receiver.something(1)
    receiver.something(2)
  end

  it 'passes if method is called with all allowed arguments in different order' do
    expect(receiver).to receive(:something).with(any_of(1, 2)).twice
    receiver.something(2)
    receiver.something(1)
  end

  it 'fails if method is called with an unexpected argument', :reset do
    expect(receiver).to receive(:something).with(any_of(1, 2)).twice
    expect { receiver.something(3) }
      .to fail_with('unexpected arguments')
  end

  it 'fails if method is called with an allowed and an unexpected arguments', :reset do
    expect(receiver).to receive(:something).with(any_of(1, 2)).twice
    expect do
      receiver.something(1)
      receiver.something(3)
    end
      .to fail_with('unexpected arguments')
  end

  it 'fails if method is called with an unexpected and an allowed arguments', :reset do
    expect(receiver).to receive(:something).with(any_of(1, 2)).twice
    expect do
      receiver.something(3)
      receiver.something(1)
    end
      .to fail_with('unexpected arguments')
  end

  context 'when negated' do
    it 'passes if method is not called with disallowed arguments' do
      expect(receiver).not_to receive(:something).with(any_of(1, 2))
      receiver.something(3)
    end

    it 'fails if method is called with a disallowed argument', :reset do
      expect(receiver).not_to receive(:something).with(any_of(1, 2))
      expect { receiver.something(1) }
        .to fail_with('expected: 0 times with arguments: (any of [1, 2])', 'received: 1')
    end

    it 'fails if method is called with both a disallowed and not disallowed arguments', :reset do
      expect(receiver).not_to receive(:something).with(any_of(1, 2))
      expect do
        receiver.something(3)
        receiver.something(1)
      end
        .to fail_with('expected: 0 times with arguments: (any of [1, 2])', 'received: 1')
    end
  end
end
