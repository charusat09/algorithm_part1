require '../helpers/file_operations.rb'
require '../helpers/logger.rb'

class QuickFind
  include FileOperations
  include Logger

  attr_accessor :input

  def initialize(n)
    @input = [*(0..n)]
  end

  def union(p,q)
    pid = input[p]
    qid = input[q]
    input.length.times do |i|
      if (pid == input[i])
        input[i] = qid
      end
    end
  end

  def is_connected?(p,q)
    pid = find_root(p)
    qid = find_root(q)
    pid == qid ? true : false
  end

  private

  def find_root(k)
    input[k]
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

  qf = QuickFind.new(n)

  qf.log(n,name,size,qf,p,q)
end
