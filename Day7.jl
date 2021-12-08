path = "C:\\AoC2021\\Day7.txt"
data = parse.(Int,split(readline(path),","))

minFuel = Inf
isPart1 = false
for i=1:maximum(data)
  if isPart1
    fuelCost = sum(broadcast(abs,data.-i))
  else
    fuelCost = sum((data[data.>i].-i).*(data[data.>i].-i.+1)./2) + 
               sum((i.-data[data.<i]).*(i.-data[data.<i].+1)./2)
  end
  if fuelCost<minFuel minFuel = fuelCost end
end
