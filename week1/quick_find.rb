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
    if pid == qid
      puts "wolla .. they are connected"
    else
      puts "sorry... try again"
    end
  end

  private

  def find_root(k)
    input[k]
  end

end

bench_mark = [
              {'N' => 2000, 'name' => 'qu', 'size' => '2k','p' => Random.new.rand(2000), 'q'=> Random.new.rand(2000)},
              {'N' => 4000, 'name' => 'qu', 'size' => '4k','p' =>Random.new.rand(2000), 'q'=> Random.new.rand(2000)},
              {'N' => 8000, 'name' => 'qu', 'size' => '8k','p' =>Random.new.rand(2000), 'q'=> Random.new.rand(2000)},
              {'N' => 16000, 'name' => 'qu', 'size' => '16k','p' =>Random.new.rand(2000), 'q'=> Random.new.rand(2000)},
              {'N' => 32000, 'name' => 'qu', 'size' => '32k','p' =>Random.new.rand(2000), 'q'=> Random.new.rand(2000)}
            ]
bench_mark.each do |bench|
  n = bench['N']
  name = bench['name']
  size = bench['size']
  p = bench['p']
  q = bench['q']

  qf = QuickFind.new(n)

  qf.log(n,name,size,qf,p,q)
end