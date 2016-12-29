#!/Users/abonneca/.brew/bin/ruby -w
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    CoffeeCroissant.rb                                 :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abonneca <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/12/05 21:31:28 by abonneca          #+#    #+#              #
#    Updated: 2016/12/05 21:59:39 by abonneca         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

def coffee
data = [
	['Frank', 33],
	['Stacy', 15],
	['Juan' , 24],
	['Dom' , 32],
	['Steve', 24],
	['Jill' , 24]
]
data.sort_by { |name, age| [age, name] }.each { |x| puts x[0]}
end

coffee
