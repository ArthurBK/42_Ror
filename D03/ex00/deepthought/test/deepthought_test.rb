require 'test_helper'

class DeepthoughtTest < Minitest::Test

	def self.test_order
		:alpha
	end

	def setup
		@deep = Deepthought::Deepthought.new
	end

	def test_that_it_has_a_version_number
		refute_nil ::Deepthought::VERSION
	end

	def test_it_does_something_useful
		puts "warning assert".yellow if assert true
	end

	def test_object
		assert_kind_of(Deepthought::Deepthought, Deepthought::Deepthought.new)
	end

	def test_output_response_true
		assert_output(/42/) do
			@deep.respond("The Ultimate Question of Life, the Universe and Everything")
		end 
	end

	def test_output_response_false
		assert_output(/Mmmm i'm bored/) { @deep.respond("What up Doc'") } 
	end

	def test_return_value
		if assert_equal("42", @deep.respond("The Ultimate Question of Life, the Universe and Everything"))
			puts "returns \"42\" when asked \"The Ultimate Question of Life, the Universe and Everything\"".green
		end
		if assert_equal("Mmmm i'm bored", @deep.respond("What up Doc'"))
			puts "returns \"Mmmm i'm bored\" when asked \"What up Doc'\"".green
		end
	end
end