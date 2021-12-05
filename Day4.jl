path = "C:\\AoC2021\\Day4.txt"
data = readlines(path)
bingoNums = parse.(Int,split(data[1],","))
boards = [parse.(Int,reduce(hcat,split.(data[i:i+4]))) for i in 3:6:length(data)-4]

function playBingo(boards,bingoNums,isPart1)
  finishedBoards = []
  for n = bingoNums
    for i = 1:length(boards)
      if (i in finishedBoards) continue end
      boards[i][boards[i].==n] .= -1
      if any([sum(boards[i],dims=1) sum(boards[i],dims=2)'].==-5)
        finishedBoards = [i; finishedBoards] # latest first
      end
    end
    if length(finishedBoards)==(isPart1 ? 1 : 100)
      return sum(boards[finishedBoards[1]][boards[finishedBoards[1]].!=-1]).*n
    end
  end
end
