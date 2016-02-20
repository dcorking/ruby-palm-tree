# This short recursive "count" function is by Dan Grossmann, for educational use only.
# It was presented in his Programming Languages course
# https://homes.cs.washington.edu/~djg/teachingMaterials/

# It has been adapted in attempts to trace it, by students Amos
# Madanes and David Corking
# https://class.coursera.org/proglang-003/forum/thread?thread_id=1456
# (Link available to registered students only.)

# See also file foo-count.rb

@max = 1000

# def count base
#   if base>@max
#     raise "reached max! make user you initialize with 1000"
#   elsif yield base
#     1
#   else
#     1 + (count(base+1) {|i| yield i})
#   end
# end

# def count base
#   if yield base
#     1
#   else
#     1 + (count(base+1) {|i| yield i})
#   end
# end


# ;;;;;;;;;;;;;;;

# David Corking wrote:
# @Amos In case it helps, here is a translation into Ruby's equivalent of first-class functions.
#
def count_proc(base, test)
 if test.call(base)
    1
  else
    1 + (count_proc(base+1, test))
  end
end

# count_proc(15,  Proc.new {|i| i == 20})
count_proc(15,  lambda {|i| i == 20})

count(15) {|i| i == 20}

# irb(main):471:0> count_proc(15,  lambda {|i| puts "I am in block with base: #{i}"; i == 20})
# I am in block with base: 15
# I am in block with base: 16
# I am in block with base: 17
# I am in block with base: 18
# I am in block with base: 19
# I am in block with base: 20
# => 6
# irb(main):472:0> count(15) {|i| puts "I am in block with base: #{i}"; i == 20}
# I am in block with base: 15
# I am in block with base: 16
# I am in block with base: 17
# I am in block with base: 18
# I am in block with base: 19
# I am in block with base: 20
# => 6
# irb(main):473:0>

def count base
  if yield base
    1
  else
    1 + (count(base+1) {|i| puts "I am a block wrapping the block you want. i = #{i}, base = #{base}\n";
                            yield i})
  end
end

# irb(main):486:0> count(15) {|i| puts "I am the original block with i = #{i}"; i == 20}
# I am the original block with i = 15
# I am a block wrapping the block you want. i = 16, base = 15
# I am the original block with i = 16
# I am a block wrapping the block you want. i = 17, base = 16
# I am a block wrapping the block you want. i = 17, base = 15
# I am the original block with i = 17
# I am a block wrapping the block you want. i = 18, base = 17
# I am a block wrapping the block you want. i = 18, base = 16
# I am a block wrapping the block you want. i = 18, base = 15
# I am the original block with i = 18
# I am a block wrapping the block you want. i = 19, base = 18
# I am a block wrapping the block you want. i = 19, base = 17
# I am a block wrapping the block you want. i = 19, base = 16
# I am a block wrapping the block you want. i = 19, base = 15
# I am the original block with i = 19
# I am a block wrapping the block you want. i = 20, base = 19
# I am a block wrapping the block you want. i = 20, base = 18
# I am a block wrapping the block you want. i = 20, base = 17
# I am a block wrapping the block you want. i = 20, base = 16
# I am a block wrapping the block you want. i = 20, base = 15
# I am the original block with i = 20
# => 6
# irb(main):487:0>

# David translated the function into Racket (Scheme)
# (define (count base f)
#   (if (f base)
#     1
#     (+ 1 (count (+ 1 base) f))))
# ;
# ; > (count 15 (lambda (x) (= x 20)))
# ; 6
