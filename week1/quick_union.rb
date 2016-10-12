require '../helpers/file_operations.rb'
require '../helpers/logger.rb'

class QuickUnion
  include FileOperations
  include Logger

  attr_accessor :objects
  
  def initialize(n)
    @objects = [*(0..n-1)]
  end

  def union(p,q)
    qid = root(q)
    pid = root(p)
    objects[pid] = qid
  end

  def is_connected?(p,q)
    pid = root(p)
    qid = root(q)
    pid == qid ? true : false
  end

  private
	
  def root(i)
    i = objects[i] while(i != objects[i])
    return i
  end

end

bench_mark = [
              {'N' => 2000, 'name' => 'qf', 'size' => '2k'},
              {'N' => 4000, 'name' => 'qf', 'size' => '4k'},
              {'N' => 8000, 'name' => 'qf', 'size' => '8k'},
              {'N' => 16000, 'name' => 'qf', 'size' => '16k'},
              {'N' => 32000, 'name' => 'qf', 'size' => '32k'}
            ]

bench_mark.each do |bench|
	n = bench['N']
	name = bench['name']
	size = bench['size']
	p = 335 # can peak any value from data file under files/
	q = 553 # can peak any value from data file under files/

	qu = QuickUnion.new(n)

	qu.log(n,name,size,qu,p,q)
end
