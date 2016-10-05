class QuickFind
  attr_accessor :input

  def initialize(n)
    @input = [*(0..n)]
  end

  def generate_input_file(n)
    file = File.open("qf_1k.txt",mod='w')
    n.times {|i| p = Random.new.rand(i+1);file.syswrite("#{p}\n")}
  end

  def read_file
    IO.foreach("qf_1k.txt"){|block| union(block.to_i,block.to_i+1)}
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

N = 16000
qf = QuickFind.new(N)
qf.generate_input_file(N)

t1 = Time.now

qf.read_file
qf.is_connected?(1,5)

t2 = Time.now
puts " input size: #{N} & time: #{t2-t1}"
