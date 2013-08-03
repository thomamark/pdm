class StaticPagesController < ApplicationController
  def home
	@tt = Score.order("score DESC").limit(9)
	@tt_today = Score.where(created_at: Time.now.midnight..(Time.now.midnight + 1.day)).order("score DESC").limit(9)

	# pad with fake scores if there aren't enough real ones 
	[@tt, @tt_today].each do |a|
		if a.length() < 9
			(9-a.length()).times do
				a << Score.new(name: "AAA", score: 0.0)
			end
		end
	end

  end

  def play
  end

  def lb
  end

end
