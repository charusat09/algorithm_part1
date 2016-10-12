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
    pid == qid ? true : false
  end

  private
	
  def root(i)
    i = objects[i] while(i != objects[i])
    return i
  end

end

bench_mark = [
              {'N' => 2000},
              {'N' => 4000},
              {'N' => 8000},
              {'N' => 16000},
              {'N' => 32000}
            ]

bench_mark.each do |bench|
  n = bench['N']
  p = 335 # can pick any value from data file under files/
  q = 553 # can pick any value from data file under files/
  wqu = WeightedQuickUnion.new(n)
  wqu.log(wqu,p,q,n)
end
