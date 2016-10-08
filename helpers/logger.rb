module Logger
	def log(n,name,size,object,p,q)
		inputs = { 'n' => n, 'name' => name, 'size' => size}

		object.generate_input_file(inputs)

		t1 = Time.now

		object.read_file('name' => name, 'size' => size)

		puts object.is_connected?(p,q)

		t2 = Time.now

		puts "p : #{p} \nq: #{q}"
		puts "input size: #{n} \ntime taken: #{t2-t1} \n "
		puts "******************************"
	end

end