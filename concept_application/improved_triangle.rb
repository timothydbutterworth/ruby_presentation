def compose(proc1, proc2)

end
def toLine(wdth, arry, alignment)
  result, spaces = ["", ""]
  filled = []
  ((wdth - arry.length)/2).times { filled << ""}
  filled = filled + arry
  filled.each { |n| result = result + alignment.call(n) }
  puts result
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
  align_key = ARGV[1]
end

wdth = size*2-1

width = 2*(size.to_s.length)

center = Proc.new do |num|
  str = num.to_s
  l = str.length
  i = -1
  (width-l).times do
    str = ((i==-1) ? " "+str : str + " " )
    i*=-1
  end
  str
end
left = Proc.new do |num|
  str = num.to_s
  l = str.length
  (width-l).times do
    str = str+" "
  end
  str
end
right = Proc.new do |num|
  str = num.to_s
  l = str.length
  (width-l).times do
    str = " "+str
  end
  str
end
pipecenter = Proc.new do |num|
  wrapper = " "
  if(num!=" " && num!="")
    wrapper = "|"
  end
  wrapper + center.call(num)
end

alignment = {}
alignment["left"] = left
alignment["right"] = right
alignment["center"] = center
alignment["pipecenter"] = pipecenter

use_alignment = alignment[align_key]
if(use_alignment==nil)
  use_alignment = center
end
updown(size).each { |n| toLine(wdth, updown(n), use_alignment) }
