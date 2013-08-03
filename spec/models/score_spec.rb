require 'spec_helper'

describe Score do
	before { @score = Score.new(name: "MRT", score: 10.7)}

	subject { @score }
	
	it { should respond_to(:name) }
	it { should respond_to(:score) }

end
