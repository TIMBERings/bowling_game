require 'rspec'
require_relative '../src/frame'

describe 'frame' do
  describe '#total' do
    it 'handles a strike' do
      frame = Frame.new({frame: 1,
 first: 10,
 second: 0,
 third: nil,
 score: nil,
 spare: false,
 strke: false,
 split: false})
      expect(frame.total).to eq 10
    end
    it 'handles a spare' do
      frame = Frame.new({frame: 1,
 first: 0,
 second: 10,
 third: nil,
 score: nil,
 spare: false,
 strke: false,
 split: false})
      expect(frame.total).to eq 10
    end
    it 'handles an open' do
      frame = Frame.new({frame: 1,
 first: 9,
 second: 0,
 third: nil,
 score: nil,
 spare: false,
 strke: false,
 split: false})
      expect(frame.total).to eq 9
    end
    it 'handles a 0' do
      frame = Frame.new({frame: 1,
 first: 0,
 second: 0,
 third: nil,
 score: nil,
 spare: false,
 strke: false,
 split: false})
      expect(frame.total).to eq 0
    end
  end

  describe '#spare?' do
    it 'returns true on spare' do
      frame = Frame.new({frame: 1,
 first: 9,
 second: 1,
 third: nil,
 score: nil,
 spare: false,
 strke: false,
 split: false})
      expect(frame.spare?).to be_truthy
    end
    it 'returns false on strike' do
      frame = Frame.new({frame: 1,
 first: 10,
 second: 0,
 third: nil,
 score: nil,
 spare: false,
 strke: false,
 split: false})
      expect(frame.spare?).to be_falsey
    end
    it 'returns false on open' do
      frame = Frame.new({frame: 1,
 first: 9,
 second: 0,
 third: nil,
 score: nil,
 spare: false,
 strke: false,
 split: false})
      expect(frame.spare?).to be_falsey
    end
  end
  describe '#strike?' do
    it 'returns false on spare' do
      frame = Frame.new({frame: 1,
 first: 9,
 second: 1,
 third: nil,
 score: nil,
 spare: false,
 strke: false,
 split: false})
      expect(frame.strike?).to be_falsey
    end
    it 'returns true on strike' do
      frame = Frame.new({frame: 1,
 first: 10,
 second: 0,
 third: nil,
 score: nil,
 spare: false,
 strke: false,
 split: false})
      expect(frame.strike?).to be_truthy
    end
    it 'returns false on open' do
      frame = Frame.new({frame: 1,
 first: 0,
 second: 4,
 third: nil,
 score: nil,
 spare: false,
 strke: false,
 split: false})
      expect(frame.strike?).to be_falsey
    end
  end
  describe '#open?' do
    it 'returns false on spare' do
      frame = Frame.new({frame: 1,
 first: 9,
 second: 1,
 third: nil,
 score: nil,
 spare: false,
 strke: false,
 split: false})
      expect(frame.open?).to be_falsey
    end
    it 'returns false on strike' do
      frame = Frame.new({frame: 1,
 first: 10,
 second: 0,
 third: nil,
 score: nil,
 spare: false,
 strke: false,
 split: false})
      expect(frame.open?).to be_falsey
    end
    it 'returns true on open' do
      frame = Frame.new({frame: 1,
 first: 0,
 second: 4,
 third: nil,
 score: nil,
 spare: false,
 strke: false,
 split: false})
      expect(frame.open?).to be_truthy
    end
  end
end
