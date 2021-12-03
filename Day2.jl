path = "C:\\AoC2021\\Day2.txt"
data = map(split,readlines(path))

# Part 1
hor = dep = 0
for (dir,v) in data
  v = parse(Int,v)
  if dir == "forward"
    hor += v
  elseif dir == "up"
    dep -= v
  elseif dir == "down"
    dep += v
  end
end
hor*dep

# Part 2
hor = dep = aim = 0
for (dir,v) in data
  v = parse(Int,v)
  if dir == "forward"
    hor += v
    dep += v*aim
  elseif dir == "up"
    aim -= v
  elseif dir == "down"
    aim += v
  end
end
hor*dep
