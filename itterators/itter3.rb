require_relative('seperator.rb')

puts "Reduce... sort of itterator"
sep

arry = []
100.times { |i| arry << (i+1) }

puts arry.reduce(0) { |acc, val| acc + val }

sep
