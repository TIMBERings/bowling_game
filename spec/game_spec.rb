require 'rspec'
require_relative '../src/game'
require_relative '../src/frame'

describe 'game' do
  describe '#score_game' do
    it 'can score a perfect game' do
      game = Game.new(
          {
              score: nil,
              frames: [
                  Frame.new({frame: 1, first: 10, second: nil, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 2, first: 10, second: nil, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 3, first: 10, second: nil, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 4, first: 10, second: nil, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 5, first: 10, second: nil, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 6, first: 10, second: nil, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 7, first: 10, second: nil, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 8, first: 10, second: nil, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 9, first: 10, second: nil, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 10, first: 10, second: 10, third: 10, score: nil, mark: true, split: false})
              ]
          }
      )
      expect(game.score).to eq 300
    end

    it 'can score a 0 game' do
      game = Game.new(
          {
              score: nil,
              frames: [
                  Frame.new({frame: 1, first: 0, second: 0, third: nil, score: nil, mark: false, split: false}),
                  Frame.new({frame: 2, first: 0, second: 0, third: nil, score: nil, mark: false, split: false}),
                  Frame.new({frame: 3, first: 0, second: 0, third: nil, score: nil, mark: false, split: false}),
                  Frame.new({frame: 4, first: 0, second: 0, third: nil, score: nil, mark: false, split: false}),
                  Frame.new({frame: 5, first: 0, second: 0, third: nil, score: nil, mark: false, split: false}),
                  Frame.new({frame: 6, first: 0, second: 0, third: nil, score: nil, mark: false, split: false}),
                  Frame.new({frame: 7, first: 0, second: 0, third: nil, score: nil, mark: false, split: false}),
                  Frame.new({frame: 8, first: 0, second: 0, third: nil, score: nil, mark: false, split: false}),
                  Frame.new({frame: 9, first: 0, second: 0, third: nil, score: nil, mark: false, split: false}),
                  Frame.new({frame: 10, first: 0, second: 0, third: nil, score: nil, mark: false, split: false})
              ]
          }
      )
      expect(game.score).to eq 0
    end

    it 'can score a markless game' do
      game = Game.new(
          {
              score: nil,
              frames: [
                  Frame.new({frame: 1, first: 0, second: 9, third: nil, score: nil, mark: false, split: false}),
                  Frame.new({frame: 2, first: 1, second: 8, third: nil, score: nil, mark: false, split: false}),
                  Frame.new({frame: 3, first: 2, second: 7, third: nil, score: nil, mark: false, split: false}),
                  Frame.new({frame: 4, first: 3, second: 6, third: nil, score: nil, mark: false, split: false}),
                  Frame.new({frame: 5, first: 4, second: 5, third: nil, score: nil, mark: false, split: false}),
                  Frame.new({frame: 6, first: 5, second: 4, third: nil, score: nil, mark: false, split: false}),
                  Frame.new({frame: 7, first: 6, second: 3, third: nil, score: nil, mark: false, split: false}),
                  Frame.new({frame: 8, first: 7, second: 2, third: nil, score: nil, mark: false, split: false}),
                  Frame.new({frame: 9, first: 8, second: 1, third: nil, score: nil, mark: false, split: false}),
                  Frame.new({frame: 10, first: 9, second: 0, third: nil, score: nil, mark: false, split: false})
              ]
          }
      )
      expect(game.score).to eq 90
    end

    it 'can score a dutch game' do
      game = Game.new(
          {
              score: nil,
              frames: [
                  Frame.new({frame: 1, first: 1, second: 9, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 2, first: 10, second: nil, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 3, first: 1, second: 9, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 4, first: 10, second: nil, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 5, first: 1, second: 9, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 6, first: 10, second: nil, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 7, first: 1, second: 9, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 8, first: 10, second: nil, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 9, first: 1, second: 9, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 10, first: 10, second: 1, third: 9, score: nil, mark: true, split: false})
              ]
          }
      )
      expect(game.score).to eq 200
    end

    it 'can score a general game' do
      game = Game.new(
          {
              score: nil,
              frames: [
                  Frame.new({frame: 1, first: 8, second: 2, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 2, first: 10, second: nil, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 3, first: 10, second: nil, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 4, first: 9, second: 0, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 5, first: 10, second: nil, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 6, first: 10, second: nil, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 7, first: 10, second: nil, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 8, first: 8, second: 1, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 9, first: 10, second: nil, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 10, first: 10, second: 9, third: 1, score: nil, mark: true, split: false})
              ]
          }
      )
      expect(game.score).to eq 212
    end
  end

  describe '#score_frames' do
    it 'scores each frame of a game' do
      game = Game.new(
          {
              score: nil,
              frames: [
                  Frame.new({frame: 1, first: 8, second: 2, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 2, first: 10, second: nil, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 3, first: 10, second: nil, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 4, first: 9, second: 0, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 5, first: 10, second: nil, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 6, first: 10, second: nil, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 7, first: 10, second: nil, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 8, first: 8, second: 1, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 9, first: 10, second: nil, third: nil, score: nil, mark: true, split: false}),
                  Frame.new({frame: 10, first: 10, second: 9, third: 1, score: nil, mark: true, split: false})
              ]
          }
      )

      scores = game.frames.collect do |frame|
        frame.score
      end

      expect(scores).to eq [20, 49, 68, 77, 107, 135, 154, 163, 192, 212]
    end
  end
end

