require 'active_support/core_ext/integer/inflections'
class StaticPagesController < ApplicationController
  def home
	@tt = Score.order("score DESC").limit(9)
	@tt_today = Score.where(created_at: Time.now.midnight..(Time.now.midnight + 1.day)).order("score DESC").limit(9)

	# pad with fake scores if there aren't enough real ones 
	[@tt, @tt_today].each do |a|
		if a.length() < 9
			(9-a.length()).times do
				a << Score.new(name: "???", score: 0.0)
			end
		end
	end
  end

  def play
  end

  def lb
  end

  def gmm
  end

  def rank
	@tt = Score.order("score DESC").limit(9)
	@tt_today = Score.where(created_at: Time.now.midnight..(Time.now.midnight + 1.day)).order("score DESC").limit(9)

	begin
		@coverage = params[:c].to_f
	rescue
		@coverage = 0.0
	end
	
	@today = @tt_today.index(@tt_today.find { |s| s.score <= @coverage})
	@today = if @today.nil? then "Embarrassment"  else (@today+1).ordinalize end

	@overall = @tt.index(@tt.find { |s| s.score <= @coverage})
	@overall = if @overall.nil? then "Embarrassment"  else (@overall+1).ordinalize end

	@result = {:today => @today, :overall => @overall, :coverage => @coverage}

	render json: @result
  end

end
