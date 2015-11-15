# Class defining a Game composed of frames
class Game
  attr_accessor :frames, :score, :score_map

  def initialize(options)
    @frames = options[:frames]
    @score = options[:score]
    @score_map = []
  end

  def finalize_game
    score_game
    total_frames
  end

  private

  def score_game
    @frames.each_with_index do |frame, index|
      running_total = @score_map[-1] ? @score_map[-1] : 0
      if index <= 8
        total_normal_frame(frame, running_total, index) if index
      else
        total_tenth_frame
      end
    end
    @score = @score_map[-1]
  end

  def total_normal_frame(frame, running_total, index)
    if frame.strike?
      @score_map.push(running_total + score_strike(index))
    elsif frame.spare?
      @score_map.push(running_total + score_spare(index))
    else
      @score_map.push(running_total + score_open(index))
    end
  end

  def total_tenth_frame
    frame = @frames[9]
    score = frame.first + frame.second
    score += frame.third if frame.third
    @score_map.push(@score_map[-1] + score)
  end

  def total_frames
    @frames.each_with_index do |frame, index|
      frame.score = @score_map[index]
    end
  end

  def score_strike(index)
    frame = @frames[index + 1]
    next_frame = @frames[index + 2]
    10 + frame.first + (frame.second ? frame.second : next_frame.first)
  end

  def score_spare(index)
    10 + @frames[index + 1].first
  end

  def score_open(index)
    @frames[index].first + @frames[index].second
  end
end
