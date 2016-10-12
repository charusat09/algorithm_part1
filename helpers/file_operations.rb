module FileOperations
  # generate_input_file is out dated
	def generate_input_file(options={})
		n = options.fetch('n',1000)
    name = options.fetch('name','algo')
    size = options.fetch('size','1k')

    file = File.open("files/#{name}_#{size}.txt",'w')
    n.times {|i| p = Random.new.rand(i+1);file.syswrite("#{p}\n")}
  end

  def read_file(options={})
    n = options.fetch('n',1000)
  	name = options.fetch('name','algo')
		size = options.fetch('size','1k')

    IO.foreach("files/mediumUF.txt") do |block| 
      input = block.split(" ")
      p , q = input[0].to_i, input[1].to_i
      self.union(p,q) unless self.is_connected?(p,q)
    end
  end
end