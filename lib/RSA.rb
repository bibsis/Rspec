require 'prime'

class RSA
   def initialize n, e, d 		
		@n = n
		@e = e
		@d = d
   end
   
   def n
      return @n
   end
   
   def e
      return @e
   end
   
   def d
      return @d
   end
   
   def new_key
	keys = Array.new(3)
	p = 0
	q = 0

	while !Prime.prime?(p)
		p = rand(1...99)		
	end
	while !Prime.prime?(q)
		q = rand(1...99)		
	end

	n = p * q

	lcm = (p - 1).lcm(q - 1)

	e = rand(lcm)
	while e.gcd(lcm) != 1
		e = rand(lcm)
	end
	
	d = 1
	while (e * d)%lcm != 1
		d += 1
	end			

	keys[0] = n
	keys[1] = e
	keys[2] = d

	return keys
   end
   
   def encrypt message
		message.chars.map { |ch| (ch.ord ** @e % @n) }.join('-')
   end
   
   def decrypt message
		message.split("-").map { |seg| (seg.to_i ** @d % @n).chr }.join('')
   end 
end

#rsa = RSA.new(*RSA.new(0, 0, 0).new_key)

#p rsa.n

#p rsa.e

#p rsa.d

#encrypt = rsa.encrypt("Right and round baby")
#p encrypt
#decrypt = rsa.decrypt(encrypt)
#p decrypt
