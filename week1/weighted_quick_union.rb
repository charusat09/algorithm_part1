require '../helpers/file_operations.rb'
require '../helpers/logger.rb'

class WeightedQuickUnion
	include FileOperations
	include Logger

	attr_accessor :objects, :size

	def initialize(n)
		@objects = [*(0..n-1)]
		@size = Array.new(n) { |i| 1 }
	end

	def union(p,q)
		qid = root(q)
		pid = root(p)
		
		return if pid == qid

		if size[pid] > size[qid]
			objects[qid] = pid
			size[qid] += size[pid]
		else
			objects[pid] = qid
			size[pid] += qid
		end
	end

	def is_connected?(p,q)
		pid = root(p)
		qid = root(q)
		pid == qid ? "wolla .. they are connected" : "sorry... try again"
	end

	private
	
	def root(i)
		i = objects[i] while(i != objects[i])
		return i
	end

end

bench_mark = [
							{'N' => 2000, 'name' => 'wqu', 'size' => '2k','p' => Random.new.rand(2000), 'q'=> Random.new.rand(2000)},
							{'N' => 4000, 'name' => 'wqu', 'size' => '4k','p' =>Random.new.rand(2000), 'q'=> Random.new.rand(2000)},
							{'N' => 8000, 'name' => 'wqu', 'size' => '8k','p' =>Random.new.rand(2000), 'q'=> Random.new.rand(2000)},
							{'N' => 16000, 'name' => 'wqu', 'size' => '16k','p' =>Random.new.rand(2000), 'q'=> Random.new.rand(2000)},
						  {'N' => 32000, 'name' => 'wqu', 'size' => '32k','p' =>Random.new.rand(2000), 'q'=> Random.new.rand(2000)}
						]

bench_mark.each do |bench|
	n = bench['N']
	name = bench['name']
	size = bench['size']
	p = bench['p']
	q = bench['q']

	qu = WeightedQuickUnion.new(n)

	qu.log(n,name,size,qu,p,q)
end