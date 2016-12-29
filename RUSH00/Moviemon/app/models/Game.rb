class Game
	attr_accessor :current_movie, :fight, :lost, :movies, :victory, :index_page

	def initialize
		@movies = []
		20.times do |i|
			@movies << Movie.new
		end
		@current_movie = {}
		@fight = false 
		@lost = false 
		@victory = false 
		@index_page = false
	end

	def save
		file = File.open("save.json", "r").read
		new_content =  JSON.parse(file)
		selected = new_content[$selected.active.to_s]
		selected["movidex"] = $player.moviedex
		selected["player_x"] = $player.x_pos
		selected["player_y"] = $player.y_pos
		selected["strength"] = $player.strength
		selected["movies"] = $game.movies
		File.open("save.json", "w") { |f| f.write new_content.to_json}
		# byebug
		# file.has_key?($selected.active)
	end

	def load
		file = File.open("save.json", "r").read
		selected = JSON.parse(file)[$selected.active.to_s]
		if !selected.empty?
			byebug
			$player.moviedex = selected["moviedex"]
			$player.x_pos = selected["player_x"]
			$player.y_pos = selected["player_y"]
			$strength = selected["strength"]
			$game.movies = selected["movies"]
		end
		# byebug
	end


	def get_movie
		@movies.pop
	end




end