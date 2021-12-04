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
dataLeft = data; iC = 1
while size(dataLeft,1)>1
  thisCol = map((x)->parse(Int,x[iC]),dataLeft)
  mostCommon = sum(thisCol)>=size(dataLeft,1)/2 ? 1 : 0
  dataLeft = dataLeft[thisCol.!=mostCommon]
  iC += 1
end

# Run the above once with ==mostCommon and once with != and keep the output
parse(Int,dataLeft1[1],base=2).*parse(Int,dataLeft2[1],base=2)
