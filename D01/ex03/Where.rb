#!/Users/abonneca/.brew/bin/ruby -w
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Where.rb                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abonneca <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/12/05 19:53:33 by abonneca          #+#    #+#              #
#    Updated: 2016/12/05 20:00:36 by abonneca         ###   ########.fr        #
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
	if states.has_key?(place)
		puts capitals_cities[states[place]]
	else
		puts "Unknown state"
	end
end

def main
	if ARGV.size == 1
		where(ARGV[0])
	end
end

main
