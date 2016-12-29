#!/Users/abonneca/.brew/bin/ruby
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ex04.rb                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abonneca <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/12/08 07:48:43 by abonneca          #+#    #+#              #
#    Updated: 2016/12/08 09:30:21 by abonneca         ###   ########.fr        #
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
			return "<#{tag}>\n#{@content.map(&:to_s).join("\n")}\n</#{tag}>" unless @content.empty?
			return "<#{tag}" + opt.map{ |k,v| " #{k}='#{v}'"}.join(' ') + " />"
		elsif @content.class == Text
			return "<#{tag}>#{@content.string}</#{tag}>"
		end
	end

end


module Essai
	def initialize(string, opt = {})
		super
		@tag = self.class
		if string.class == String
			@content = Text.new(string)
		else
			@content = string
			@opt = opt
		end
	end
end

class Title < Elem
	include Essai
end

class Head < Elem
	include Essai
end

class Html < Elem
	include Essai
end

class Body < Elem
	include Essai
end

class Meta < Elem
	include Essai
end

class Img < Elem
	include Essai
end

class Table < Elem
	include Essai
end

class Th < Elem
	include Essai
end

class Tr < Elem
	include Essai
end

class Td < Elem
	include Essai
end

class Ul < Elem
	include Essai
end

class Ol < Elem
	include Essai
end

class Li < Elem
	include Essai
end

class H1 < Elem
	include Essai
end

class H2 < Elem
	include Essai
end

class P < Elem
	include Essai
end

class Div < Elem
	include Essai
end

class Span < Elem
	include Essai
end

class Hr < Elem
	include Essai
end

class Br < Elem
	include Essai
end


if $PROGRAM_NAME == __FILE__
	puts Html.new([Head.new([Title.new("Hello ground!")]),
				  Body.new([H1.new("Oh no, not again!"),
						   Img.new([], {'src':'http://i.imgur.com/pfp3T.jpg'}) ]) ])
end
