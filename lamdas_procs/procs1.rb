def itterate(lst, proc)
  lst.each do |i|
    proc.call(lst)
  end
end

p = Proc.new do |a|
  a * a
end

puts p.call(4)
