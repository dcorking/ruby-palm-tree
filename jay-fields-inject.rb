hash = [[:first_name, 'Shane'], [:last_name, 'Harvie']].inject({}) do |result, element|
  result[element.first.to_s] = element.last.downcase
  result
end

foo = Hash[[[:first_name, 'Shane'], [:last_name, 'Harvie']].collect do |element|
             [element.first.to_s, element.last.downcase]
         end]

if foo == hash
  puts 'let\'s use collect to build collections'
else
  puts 'it didn\'t work'
end

array = [1, 2, 3, 4, 5, 6].inject([]) do |result, element|
  result << element.to_s if element % 2 == 0
  result
end
if array ==  ["2", "4", "6"]
  puts 'inject works'
end
