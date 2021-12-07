path = "C:\\AoC2021\\Day6.txt"
data = parse.(Int,split(readline(path),","))

cts = [count(==(i), data) for i in collect(0:8)]

function nbFish(cts,nbDays)
  for i=1:nbDays
    prevZeros = cts[1]
    cts[1] = cts[2]
    cts[2] = cts[3]
    cts[3] = cts[4]
    cts[4] = cts[5]
    cts[5] = cts[6]
    cts[6] = cts[7]
    cts[7] = cts[8] + prevZeros
    cts[8] = cts[9]
    cts[9] = prevZeros
  end
  return sum(cts)
end

out = nbFish(cts,256)
