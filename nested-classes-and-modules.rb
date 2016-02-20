# see http://www.ruby-doc.org/core-2.1.3/Module.html#method-c-nesting
# and
# http://stackoverflow.com/questions/26057646/get-ruby-pure-class-name-without-parent-name-any-direct-method-for-it#26057768
class Qux
  class Bar
    puts 'Nesting is like this: ', Module.nesting
    $FOO = Module.nesting
  end
end
obj = Qux::Bar.new
puts obj.class
# $FOO == [Qux::Bar, Qux]
# $FOO[0].ancestors == [Qux::Bar, Object, Kernel, BasicObject]
