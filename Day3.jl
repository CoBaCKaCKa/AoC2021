path = "C:\\AoC2021\\Day3.txt"
data = readlines(path)

# Part 1
h = size(data,1); w = length(data[1]); u = zeros(w)
for iC=1:w
  thisCol = map((x)->parse(Int,x[iC]),data)
  u[iC] = sum(thisCol)>h/2
end
v = 1 .- u
prod(sum([u v] .* (2 .^ ((w-1):-1:0)),dims=1))

# Part 2
function oxyco2Filter(data,filterType)
  dataLeft = data; iC = 1
  while size(dataLeft,1)>1
    thisCol = map((x)->parse(Int,x[iC]),dataLeft)
    mostCommon = sum(thisCol)>=size(dataLeft,1)/2 ? 1 : 0
    dataLeft = filterType=="oxy" ? dataLeft[thisCol.==mostCommon] : dataLeft[thisCol.!=mostCommon]
    iC += 1
  end
  return dataLeft[1]
end

# All the above obviously assumes the inputs are "nice" (producing single output)
parse(Int,oxyco2Filter(data,"oxy"),base=2).*parse(Int,oxyco2Filter(data,"co2"),base=2)
