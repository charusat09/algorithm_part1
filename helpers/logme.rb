module LogMe
  def log(object,p,q,n)
    t1 = Time.now

    object.read_file

    puts object.is_connected?(p,q)

    t2 = Time.now

    puts "p : #{p} \nq : #{q}"
    puts "input size: #{n} \ntime taken: #{t2-t1} \n "
    puts "******************************"
  end

end
