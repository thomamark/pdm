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
	
	@today = rankString(@tt_today.rindex { |s| s.score >= @coverage})
	#@today = if @today > 7 then "Embarrassment"  else (@today+2).ordinalize end

	#@overall = @tt.rindex(@tt.find { |s| s.score <= @coverage})
	@overall = rankString(@tt.rindex { |s| s.score >= @coverage})
	
	#@overall = if @overall.nil? or @overall > 7 then "Embarrassment"  else (@overall+2).ordinalize end

	@result = {:today => @today, :overall => @overall, :coverage => @coverage}

	render json: @result
  end

  private
	def rankString(r)
		if r.nil? 
			return (1).ordinalize
		elsif r <= 7
			return (r+2).ordinalize
		else
			return "Embarrassment"
		end
	end 

end
