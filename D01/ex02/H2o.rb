#!/Users/abonneca/.brew/bin/ruby -w
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    H2o.rb                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abonneca <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/12/05 19:37:52 by abonneca          #+#    #+#              #
#    Updated: 2016/12/05 19:52:13 by abonneca         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

def eau
	hash = {}
	data = [['Caleb' , 24],
		['Calixte' , 84],
		['Calliste', 65],
		['Calvin' , 12],
		['Cameron' , 54],
		['Camil' , 32],
		['Camille' , 5],
		['Can' , 52],
		['Caner' , 56],
		['Cantin' , 4],
		['Carl' , 1],
		['Carlito' , 23],
		['Carlo' , 19],
		['Carlos' , 26],
		['Carter' , 54],
		['Casey' , 2]
	]
	data.each { |couple| hash[couple[0]] = couple[1] }
	hash.each { |k, v| puts "#{k} : #{v}"}
end

eau
