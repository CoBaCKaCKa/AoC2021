path = "C:\\AoC2021\\Day5.txt"
data = readlines(path)
data = map((x)->replace(x," -> " => ","),data)
data = reduce(hcat,map((x)->split(x,","),data))
data = map((x)->parse(Int,x).+1,data)

isPart2=true
allPoints = zeros(maximum(data[:]),maximum(data[:]))
for i=1:size(data,2)
  pts = data[:,i]
  x1 = pts[1]; y1 = pts[2]; x2 = pts[3]; y2 = pts[4];
  slope = (y2-y1)./(x2-x1)
  if x1.==x2 allPoints[x1,min(y1,y2):max(y1,y2)] .+=1 end
  if y1.==y2 allPoints[min(x1,x2):max(x1,x2),y1] .+=1 end
  if (isPart2 && x1.!=x2 && y1.!=y2)
    for x=min(x1,x2):max(x1,x2)
      if slope==1 allPoints[x,x+y1-x1]+=1 end
      if slope==-1 allPoints[x,x1+y1-x]+=1 end
    end
  end
end
