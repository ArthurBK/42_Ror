#!/Users/abonneca/.brew/bin/ruby -w
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    var.rb                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abonneca <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/12/06 18:06:04 by abonneca          #+#    #+#              #
#    Updated: 2016/12/06 18:06:11 by abonneca         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

def my_var
	a = 10
	b = "10"
	c = "dix"
	d = 10.0
	puts "mes variables :"
	puts "\ta contient : #{a} et est de type: #{a.class}"
	puts "\tb contient : #{b} et est de type: #{b.class}"
	puts "\tc contient : #{c} et est de type: #{c.class}"
	puts "\td contient : #{d} et est de type: #{d.class}"
end

my_var
