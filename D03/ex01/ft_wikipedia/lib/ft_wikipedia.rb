require "ft_wikipedia/version"
require "nokogiri"
require "open-uri"



module Ft_wikipedia
	class << self 
		attr_accessor :sites, :count

		def search(str)
			@sites = []
			@count = 1
			@special = "?<>',[]=-)(*&^%$#`~{}"
			@regex = /[#{@special.gsub(/./){|char| "\\#{char}"}}A-Z]/
			rec(str)
		end
		
		def rec(str)
			puts "First search @ :https://en.wikipedia.org/wiki/#{str}" unless str.include? "wiki"
			str = str[6..-1].capitalize if str.include? "wiki"
			str.capitalize
			begin
				raise StandardError
			rescue
				return puts "Loop detected there is no way to philosophy here" if @sites.include?(str)
			end
			@sites << str
			file = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/" + str))	
			file.xpath('//div[@id="mw-content-text"]//p').each do |elems|
				elems.children.css('a').each do |elem|
					if elem.attributes["title"] != nil
						if elem.attributes["title"].value == "Philosophy"
							puts "https://en.wikipedia.org/wiki/Philosophy"
							return @count
						end
						if (elem.children.text =~ @regex) == nil and (elem.children.text.ascii_only?) and elem.children.text.length != 0 and elem.children.text != "listen" and !elem.attributes["href"].value.include? "wiktionary"
							puts "https://en.wikipedia.org/wiki/" + str
							@count += 1
							return self.rec(elem.attributes["href"].value)
						end
					end
				end
			end
			begin
				raise StandardError
			rescue
				puts "Dead end page reached"
			end
		end
	end
end
