#commenter pour ne rien dire
class PagesController < ApplicationController
#commenter pour ne rien dire
	def editor
		@title = "editor"
	end

	def convention
		@title = "convention"
	end

	def ruby
		@title = "ruby"
	end

	def console
		@title = "console"
	end

	def numbers
		@title = "numbers"
	end

	def strings
		@title = "strings"
	end

	def arrays
		@title = "arrays"
	end

	def hashes
		@title = "hashes"
	end

	def rails_app
		@title = "rails_app"
	end

	def rails_commands
		@title = "rails_commands"
	end

	def embedded_ruby
		@title = "embedded_ruby"
	end

	def help
		@title = "help"
	end
	
	def quick_search
		@title = "quick_search"
	end	
	
	def log_book
		@title = "log_book"
	end

	def log_book_post
		str = Time.now.to_s[0..18].gsub("-","/") + " : " + params[:formulaire] + "\n"
		str += File.open("entry_log.txt", "r").read
		File.open("entry_log.txt", "w") { |f| f.write str}
		render :log_book
	end

end
