#!/Users/abonneca/.brew/bin/ruby -w
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    elm.rb                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abonneca <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/12/06 11:56:16 by abonneca          #+#    #+#              #
#    Updated: 2016/12/06 17:54:39 by abonneca         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

def parse_val(elem)
	hash = {}
	els = elem.split(", ")
	els.each do |el| 
		els = el.split(":")
		hash[els[0]] = els[1]
	end
	return(hash)
end

def	fill_with_elem(key, value)
	return("<td style=\"border: 1px solid black; padding:10px\">
<h4>#{key}</h4>
<ul>
<li>No #{value["number"]}</li>
<li>#{value["small"]}</li>
<li>#{value["molar"]}</li>
</ul>
</td>")
end


def header
	return ("<!DOCTYPE html>
		<html>
		<head>
		<meta charset=\"utf-8\">
		<title>Tableau Periodique</title>
		</head>
		<body>
		<table>"
		   )
end

def main
	hash = {}
	File.open("./periodic_table.txt", "r") do |file|
		file.each_line do |line| 
			hash[line.split("=")[0].strip] = parse_val(line.split("=")[1].strip)
		end
	end

	File.open("./periodic_table.html", "w") do |file|
		hash["Palladium"]["electron"] += " 1"
		file << header
		7.times do |i|
			position = 0
			file << "<tr>"
			hash.each do |key, value|
				if value["electron"].split.count == i + 1
					16.times do |j|
						if value["position"].to_i > position + 1
							file << "<td></td>"
							position += 1 
						end
					end
					file << fill_with_elem(key, value)
					position = value["position"].to_i
				end
			end
			file << "</tr>"
		end
		file << "</table></body></html>"
	end
end

main
