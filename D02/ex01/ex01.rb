#!/Users/abonneca/.brew/bin/ruby
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ex01.rb                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abonneca <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/12/07 12:21:29 by abonneca          #+#    #+#              #
#    Updated: 2016/12/07 12:21:29 by abonneca         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

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
		if File.exist? (@page_name + ".html")
			raise "A file named #{@page_name} already exist!"
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
		if !File.open("#{page_name}.html", "r").read.include? "<body>"
			raise "There is no body tag in #{@page_name}"
		elsif File.open("#{page_name}.html", "r").read.include? "</body>"
			raise "Body has already been closed in #{@page_name}"
		end
		write("<p>#{value}</p>\n")
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
	a.finish
end
