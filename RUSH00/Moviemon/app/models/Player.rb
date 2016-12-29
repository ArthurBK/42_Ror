class Player
	attr_accessor :x_pos, :y_pos, :life, :moviedex, :strength, :avg_strength, :index_movie, :moviedex_in_use

	def initialize
		@select = {}
		@moviedex_in_use = false
		@index_movie = 0
		@x_pos = rand(0..9)
		@y_pos = rand(0..9)
		@strength = 0
		@life = 500
		@moviedex = []
		@avg_strength = 0
		$game.movies.each { |elem| @avg_strength += elem.infos[:rating].to_f/20 }
		@avg_strength = @avg_strength.round
	end

end