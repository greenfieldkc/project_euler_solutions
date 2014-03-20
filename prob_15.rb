# Starting in the top left corner of a 2x2 grid, there are 6 routes (without backtracking) to the bottom right corner.
# 
# 
# How many routes are there through a 20x20 grid?



#for square grids, it's the middle term of the n+n row of pascal's triangle...

def calculate_num_routes(grid_size)
  pascals_row = find_pascals_row(grid_size*2)
  puts pascals_row[pascals_row.length/2]
end
  
def find_pascals_row(n)
  last_row = [1,2,1]
  3.upto(n).each do |item|
    new_row = [1]
    0.upto(last_row.length - 2).each do |num|
      new_row << (last_row[num] + last_row[num + 1])
    end
    new_row << 1
    last_row = new_row
  end
  return last_row
end


calculate_num_routes(20)
    