def commission
puts " What is the percent of commission? "
commission_percent = gets.chomp.to_i
puts "What is the price of the item sold?"
price = gets.chomp.to_f
commission = price / 100.0 * commission_percent
puts "Your commission is #{'%.0f' % commission.to_f}"
end
