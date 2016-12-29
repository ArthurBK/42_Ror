#!/Users/abonneca/.brew/bin/ruby
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ex03.rb                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abonneca <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/12/07 17:12:02 by abonneca          #+#    #+#              #
#    Updated: 2016/12/08 09:29:19 by abonneca         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

class Text
	attr_accessor :string

	def initialize (string)
		@string = string
	end
end

class Elem
	attr_accessor :tag, :content, :tag_type, :opt

	def initialize (tag, content = [], tag_type = "double", opt = {})
		@tag = tag
		@content = content
		@tag_type = tag_type
		@opt = opt
	end

	def add_content(*args)
		@content = []
		args.each { |ar| @content << ar}
		@content
	end

	def to_s
		if @content.class == Array
			return "<#{tag}>\n#{@content.map(&:to_s).join("\n")}\n</#{tag}>"
		elsif @content.class == Text
			return "<#{tag}>#{@content.string}</#{tag}>"
		elsif @content.empty?
			return "<#{tag}" + opt.map{ |k,v| " #{k}='#{v}'"}.join(' ') + " />"
		end
	end
end

if $PROGRAM_NAME == __FILE__
	body = Elem.new('body')
	head = Elem.new('head')
	h1 = Elem.new('h1',Text.new('"Oh no, not again!"'))
	title = Elem.new('title', Text.new('"Hello ground!"'))
	img = Elem.new('img', '', 'simple',{'src':'http://i.imgur.com/pfp3T.jpg'})
	html = Elem.new('html')
	head.add_content(title)
	body.add_content(h1, img)
	html.add_content(head, body)
	puts "\n"
	puts body.to_s
	puts "\nOK\n\n"
	puts html.to_s
end

