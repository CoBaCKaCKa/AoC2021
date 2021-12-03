#################
##### DAY 2 #####
#################
#Load the data
path = "C:\\AoC2021\\Day2.txt"
data = readlines(path)

# Part 1
hor = dep = 0
for dirVal in data
  dv = split(dirVal)
  dir = dv[1]
  n = parse(Int,dv[2])
  if dir == "forward"
    hor += n
  elseif dir == "up"
    dep -= n
  elseif dir == "down"
    dep += n
  end
end
hor*dep

# Part 2
hor = dep = aim = 0
for dirVal in data
  dv = split(dirVal)
  dir = dv[1]
  n = parse(Int,dv[2])
  if dir == "forward"
    hor += n
    dep += n*aim
  elseif dir == "up"
    aim -= n
  elseif dir == "down"
    aim += n
  end
end
hor*dep
