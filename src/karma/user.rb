module Karma

class User
	def initialize name, fullname
		@name, @fullname = name, fullname
	end
	protected :initialize

	def User.find name
		User.new(name,"dummy user")
	end

	def name
		@name
	end

	def fullname
	 	@fullname
	end

	def to_s
		"#{@name}=#{@fullname}"
	end
end

end
