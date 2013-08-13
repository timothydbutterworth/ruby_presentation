require_relative('seperator.rb')

puts "Number as an itterator"
sep

7.times do |i|
  puts i
end

sep

7.times { |i| puts i }

sep

2.step(20, 2) { |i| puts "#{i} "}
