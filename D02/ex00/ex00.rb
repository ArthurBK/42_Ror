#!/Users/abonneca/.brew/bin/ruby
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ex00.rb                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abonneca <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/12/06 19:27:54 by abonneca          #+#    #+#              #
#    Updated: 2016/12/06 19:27:54 by abonneca         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

class Html
	attr_reader :page_name

	def initialize(page_name)
		@page_name = page_name
		head
	end

	def write(data)
		File.open("#{page_name}.html", "a") { |f| f.write data }
	end

	def head
		write("<!DOCTYPE html>
<html>
<head>
<title>#{@page_name}</title>
</head>
<body>
<table>\n")
	end

	def dump(value)
		write("<p>#{value}</p>\n")
	end

	def finish
		write("</body>\n")
	end
end

if $PROGRAM_NAME == __FILE__
	a = Html.new("test")
	10.times{|x| a.dump("titi_number#{x}")}
	a.finish
end
