# By Dan Grossman instrumented by Amos Madanes
# https://class.coursera.org/proglang-003/forum/thread?thread_id=1456#post-6331

class Foo
  def initialize (a)
    @max = a
    puts @max.to_s+ " no more"
  end

  def silly
    yield(4,5)+yield(@max,@max)+yield(10,10)
  end

  def count base
    puts "Entering count base is: "+base.to_s+"\n"
    if base > @max
      raise "reached max had an error"
    elsif yield base
      puts "the base is: "+base.to_s+" in elsif \n"
      1
    else
      puts "the base is: "+base.to_s+" in else \n"
      1 + (count(base+1) do |i|
             puts "in do loop "+ i.to_s
             yield i
           end
           )
    end
  end
  def test3 num1, num2
    self.count(num1)  do |i|
      puts "in initial block " + i.to_s
      i==num2
    end
  end
end
