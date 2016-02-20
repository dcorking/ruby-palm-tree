def filter_up_to_ten
  result = []
  (1..10).each do |i|
    puts "testing #{i}"
    if (yield i)
      result << i
    end
  end
  result
end

filter_up_to_ten {|n| n % 2 == 0} # test for even numbers

filter_up_to_ten {|n| n > 7}
