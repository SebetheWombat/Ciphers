class Beaufort
	def initialize(v,a)
		@v = v
		@a = a
	end
	def encrypt(msg, key)
		key = @a.encrypt(key)
		msg = @v.encrypt(msg, key)
		msg = @a.encrypt(msg)
	end
end
