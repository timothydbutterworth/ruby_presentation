require_relative('seperator.rb')

arry = [2,1,3,5]

sep
puts "Array itterator"
sep

arry.each do |el|
  puts el.to_s
end

sep

arry.each { |el| puts el.to_s }

sep

map = {
  1 => "one",
  2 => "two",
  3 => "three",
  4 => "four"
}

puts "Map itterator"
sep

map.each do |key, val|
  puts "key: #{key} val: #{val}"
end

sep

map.each { |key, val| puts "key: #{key} val: #{val}"}

sep
