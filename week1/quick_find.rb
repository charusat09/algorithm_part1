require File.expand_path(File.join(File.dirname(__FILE__), 'week1_helper.rb'))

class QuickFind
  include FileOperations
  include LogMe

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
  qf = QuickFind.new(n)
  qf.log(qf,p,q,n)
end
