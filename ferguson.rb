toc = [[1, "Reflections"], [2, "Glasgow Roots"], [3, "Retirement U-turn"], [4, "A Fresh Start"], [5, "Beckham"]]

title =  "The table of contents of Sir Alex Ferguson' Biography"

toc.each do |x, y|
  lineWidth = 15
  puts title.center lineWidth
  puts x.to_s.ljust(lineWidth/2) + y.rjust(lineWidth/2)
  printf "%-*s %*s\n", lineWidth/2, x, lineWidth/2, y
end
