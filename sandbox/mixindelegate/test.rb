

module MixA
	def delegate
		"MixA delegate"
	end
end

module MixB
	def delegate
		"MixB delegate"
	end
end


class ToExtend
	def dosomething
		self.respond_to?('delegate') ?	delegate : "no delegate function defined"
	end
end


testa = ToExtend.new
testa.extend MixA
puts "MixA: " + testa.dosomething

testb = ToExtend.new
testb.extend MixB
puts "MixB: " + testb.dosomething

testc = ToExtend.new
puts "No mixin: " + testc.dosomething

testd = ToExtend.new
testd.extend MixA
testd.extend MixB
puts "MixA, MixB: " + testd.dosomething

teste = ToExtend.new
teste.extend MixB
teste.extend MixA
puts "MixB, MixA: " + teste.dosomething

