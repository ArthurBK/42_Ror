#!/Users/abonneca/.brew/bin/ruby -w
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    croissant.rb                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abonneca <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/12/05 19:36:17 by abonneca          #+#    #+#              #
#    Updated: 2016/12/06 11:45:57 by abonneca         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

def croissant
array = []

File.open("./numbers.txt", "r") do |file|
	file.each_line { |line| array << line.delete!(",").to_i}
	array.sort!.each { |nb| puts nb }
end
end

croissant
