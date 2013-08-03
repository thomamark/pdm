class ScoresController < ApplicationController

	def create
	#@score = Score.new(score_params)
	@score = Score.new(params[:score])
		if @score.save
			render :json => { :result => "success!"}
		else
			render :json => {:result => "failed to save score!"}
		end
	end

	
#	private
#		def score_params
#			params.require(:score).permit(:name, :score)
#		end
end
