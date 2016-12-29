#!/Users/abonneca/.brew/bin/ruby -w
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    erehW.rb                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abonneca <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/12/05 20:00:16 by abonneca          #+#    #+#              #
#    Updated: 2016/12/05 20:12:39 by abonneca         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

def where(place)
	states = {
		"Oregon" => "OR",
		"Alabama" => "AL",
		"New Jersey" => "NJ",
		"Colorado" => "CO"
	}
	capitals_cities = {
		"OR" => "Salem",
		"AL" => "Montgomery",
		"NJ" => "Trenton",
		"CO" => "Denver"
	}
	if capitals_cities.has_value?(place)
		puts states.key(capitals_cities.key(place))
	else
		puts "Unknown capital city"
	end
end

def main
	if ARGV.size == 1
		where(ARGV[0])
	end
end

main
