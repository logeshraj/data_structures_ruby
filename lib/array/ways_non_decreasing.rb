# function numberOfWays(array) {
#     var options = 0
#     for (var i = 1; i < array.length; i++) {
#         if (array[i-1] > array[i]) {
#             if (options != 0) return 0;
#             if (i == 1 || array[i-2] <= array[i]) ++options;
#             if (i == array.length - 1 || array[i-1] <= array[i+1]) ++options;
#             if (options == 0) return 0;
#         }
#     }
#     return (options == 0) ? array.length : options;
# }

# var arrays = [[1,2,3,4],[1,3,2,4],[1,2,4,3],[1,3,4,2],[2,4,1,3],[2,2,1,1]];
# for (var a in arrays)
#     document.write(arrays[a] + " &rarr; " + numberOfWays(arrays[a]) + "<br>");


def non_decreasing_ways(array)
  ways = 0
  index = 1
  length = array.length
  while(index < length)
    if array[index - 1] > array[index]
      return 0 if ways != 0
      ways += 1 if index == 1 || array[index - 2] <= array[index]
      ways += 1 if index == length - 1 || array[index - 1] <= array[index + 1]
      return 0 if ways == 0
    end
    index += 1
  end
  ways == 0  ? length : ways
end

p non_decreasing_ways([3,4,5,4]) #2
p non_decreasing_ways([4,5,2,3,4]) #0
p non_decreasing_ways([1,2,3,3,5,6,7])  #7
p non_decreasing_ways([1,2,3,4,6,8,5]) #1
p non_decreasing_ways([1,2,3,4,5,8,6,7,11]) #1