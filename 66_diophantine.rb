include Math

count = 0
(2..2).each do |d|
	a0 = sqrt(d).to_i
	a = a0

	p0 = a0
	q0 = 1

	p = p0
	p_prev = 1
	q = q0
	q_prev = 0

	bigP0 = 0
	bigQ0 = 1
	bigP = bigP0
	bigQ = bigQ0


	(1..1000).each do
		bigP = a * bigQ - bigP
		bigQ = (d - bigP**2)/bigQ
		a = (a0 + bigP) / bigQ



		temp_p = p
		temp_q = q

		p = a * p + p_prev
		q = a * q + q_prev

		p_prev = temp_p
		q_prev = temp_q
		
		count += 1 if p.to_s.size > q.to_s.size

	
	end
end

puts count


