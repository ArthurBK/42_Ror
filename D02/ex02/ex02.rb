#!/Users/abonneca/.brew/bin/ruby
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ex02.rb                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abonneca <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/12/07 12:22:18 by abonneca          #+#    #+#              #
#    Updated: 2016/12/07 12:22:18 by abonneca         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
class Dup_file < StandardError

	def initialize(page_name)
		@page_name = page_name
	end

	def show_state
		puts "A file named #{@page_name} already exist!"
	end

	def correct
		@page_name += ".new"
		if File.exist? (@page_name + ".html")
			show_state
			correct
		end
		@page_name
	end

	def explain
		puts "Appended #{".new"*@page_name.scan(/.new/).length} in order to create requested file: #{Dir.pwd}/#{@page_name}.html"
	end
end

class Body_closed < StandardError

	def initialize(page_name, value)
		@page_name = page_name
		@value = value
		@line_number = 0
	end

	def get_line_number
		count = 0
		File.open("#{@page_name}.html", "r") do |file| 
			file.each_line do |line|
				count += 1
				return count if line =~ /<\/body>/
			end
		end
	end

	def show_state
		@line_number = get_line_number
	end

	def correct
		new = ""
		File.open("#{@page_name}.html", "r") do |file| 
			file.each_line do |line|
				new << line unless line =~ /<\/body>/
			end
			new << "<p>#{@value}</p>\n"
			new << "</body>\n"
		end
		File.open("#{@page_name}.html", "w") { |f| f.write new}
	end

	def explain
		puts "In #{@page_name} body was closed :"
		puts "> ln :#{@line_number} </body> : text has been inserted and tag moved at end of it"
	end
end


class Html
	attr_reader :page_name

	def initialize(page_name)
		@page_name = page_name
		head
	end

	def write(data)
		File.open("#{page_name}.html", "a") { |f| f.puts data }
	end

	def head
		begin
			if File.exist? (@page_name + ".html")
				raise Dup_file, @page_name
			end		
		rescue Dup_file => dup_file
			dup_file.show_state
			@page_name = dup_file.correct
			dup_file.explain
		end
		write("<!DOCTYPE html>
<html>
<head>
<title>#{@page_name}</title>
</head>
<body>
<table>\n")
	end

	def dump(value)
		begin
			if File.open("#{page_name}.html", "r").read.include? "</body>"
				raise Body_closed.new(@page_name, value)
			end		
		rescue Body_closed => body_closed
			body_closed.show_state
			body_closed.correct
			body_closed.explain
		end
		write("<p>#{value}</p>\n") unless File.open("#{page_name}.html", "r").read.include? "</body>"
	end

	def finish
		if File.open("#{page_name}.html", "r").read.include? "</body>"
			raise "#{@page_name} has already been closed"
		end
		write("</body>\n")
	end
end

if $PROGRAM_NAME == __FILE__
	a = Html.new("test")
	10.times{|x| a.dump("titi_number#{x}")}
	a.finish
end
