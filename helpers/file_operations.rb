module FileOperations
	def generate_input_file(options={})
		n = options.fetch('n',1000)
		name = options.fetch('name','algo')
		size = options.fetch('size','1k')

    file = File.open("files/#{name}_#{size}.txt",'w')
    n.times {|i| p = Random.new.rand(i+1);file.syswrite("#{p}\n")}
  end

  def read_file(options={})
  	name = options.fetch('name','algo')
		size = options.fetch('size','1k')

    IO.foreach("files/#{name}_#{size}.txt"){|block| union(block.to_i,block.to_i+1)}
  end
end