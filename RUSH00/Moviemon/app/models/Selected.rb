class Selected
attr_accessor :active, :in_use, :action
	
	def initialize
		@active = 0
		@in_use = false
		@action = "load"
	end

end