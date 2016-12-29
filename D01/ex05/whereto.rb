#!/Users/abonneca/.brew/bin/ruby -w
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    whereto.rb                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abonneca <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/12/05 20:12:18 by abonneca          #+#    #+#              #
#    Updated: 2016/12/06 13:10:32 by abonneca         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

def define_states
	return ({
		"Oregon" => "OR",
		"Alabama" => "AL",
		"New Jersey" => "NJ",
		"Colorado" => "CO"
	})
end

def define_cities
	return ({
		"OR" => "Salem",
		"AL" => "Montgomery",
		"NJ" => "Trenton",
		"CO" => "Denver"
	})
end

def where(str)
	states = define_states
	capitals_cities = define_cities
	srchs = str.split(",")
	srchs.each do |srch|
		place = srch.strip.downcase.split.map(&:capitalize).join(' ')
		if place.size != 0
			if states.has_key?(place) || capitals_cities.has_value?(place)
				if states.has_key?(place)
					print "#{capitals_cities[states[place]]}"
					print " is the capital of #{place}"
					puts " (akr: #{states[place]})"
				else
					print "#{place}"
					print " is the capital of #{states.key(capitals_cities.key(place))}"
					puts " (akr: #{capitals_cities.key(place)})"
				end
			else
				puts "#{place} is neither a capital city nor a state"
			end
		end
	end
end

def main
	if ARGV.size == 1
		where(ARGV[0])
	end
end

main
