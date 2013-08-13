def itterate(lst, proc)
  lst.each do |element|
    proc.call(element)
  end
end

p = Proc.new do |a|
  puts (a * a).to_s
end

puts "Call a proc"
p.call(4)
puts "----------"
list = Array(1..10)

puts "Using a proc in another method"
itterate(list, p)
