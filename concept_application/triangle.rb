def toLine(wdth, arry)
  result, spaces = ["", ""]
  ((wdth - arry.length)/2).times { spaces = spaces + " " }
  arry.each { |n| result = result + n.to_s }
  puts spaces + result
end
def updown(n)
  result = []
  n.times { |i| result << (1+i) }
  (n-1).times { |i| result << ((n-1)-i) }
  return result
end

size = 9
if(ARGV!=nil && ARGV.length>0)
  size = ARGV[0].to_i
end

wdth = size*2-1

updown(size).each { |n| toLine(wdth, updown(n)) }
