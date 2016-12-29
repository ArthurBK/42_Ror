require "open-uri"
class Movie
attr_accessor :x_pos, :y_pos, :infos
	
	def initialize
		f = open("https://random-movie.herokuapp.com/random").read
		f = JSON.parse(f)
		@infos = {
			title: f["Title"],
			director: f["Director"],
			genre: f["Genre"],
			plot: f["Plot"],
			poster: f["Poster"],
			rating: f["imdbRating"].to_f * 10,
			life: 500
		}
	end



end