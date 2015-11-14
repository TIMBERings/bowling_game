class Game
  attr_accessor :frames, :score, :score_map

  def initialize(options)
    @frames = options[:frames]
    @score = options[:score]
    @score_map = []
    score_game
    score_frames
  end

  private
  def score_game
    @frames.each_with_index do |frame, index|
      running_total = @score_map[-1] ? @score_map[-1] : 0
      if index <= 8
        if frame.strike?
          @score_map.push(running_total + score_strike(index))
        elsif frame.spare?
          @score_map.push(running_total + score_spare(index))
        else
          @score_map.push(running_total + score_open(index))
        end
      else #10th frame
        score = @frames[index].first + @frames[index].second
        score += @frames[index].third if @frames[index].third
        @score_map.push(@score_map[-1] + score)
      end
    end
    @score = @score_map[-1]
  end

  def score_frames
    @frames.each_with_index do |frame, index|
      frame.score = @score_map[index]
    end
  end

  def score_strike(index)
    @frames[index+1].second.nil? ? 10 + @frames[index+1].first + @frames[index+2].first : 10 + @frames[index+1].first + @frames[index+1].second
  end

  def score_spare(index)
    10 + @frames[index+1].first
  end

  def score_open(index)
    @frames[index].first + @frames[index].second
  end
end
