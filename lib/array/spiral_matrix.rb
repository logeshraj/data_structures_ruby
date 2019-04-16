def spiral_order(matrix)
  return [] if matrix.nil? || matrix.empty?
  result = []
  rows = matrix.length
  cols = matrix[0].length
  r1 = 0
  c1 = 0
  r2 = rows - 1
  c2 = cols - 1
  while( r1 <= r2 && c1 <= c2)
    c = c1
    while(c <= c2)
      result << matrix[r1][c]
      c+=1
    end
    r = r1 + 1
    while(r <= r2)
      result << matrix[r][c2]
      r += 1
    end
    if r1 < r2 && c1 < c2
      c = c2 - 1
      while(c >= c1)
        result << matrix[r2][c]
        c -= 1
      end
      r = r2 - 1
      while(r > r1)
        result << matrix[r][c1]
        r -= 1
      end
    end
    r1 += 1
    r2 -= 1
    c1 += 1
    c2 -= 1
  end
  result
end

matrix = [
 [ 1, 2, 3 ],
 [ 4, 5, 6 ],
 [ 7, 8, 9 ]
]

matrix = []

matrix = [[1,2,3]]
matrix = [[1],[2],[3]]

matrix = [[1,2,3,4],
          [5,6,7,8],
          [9,10,11,12],
          ]

matrix = [[1,2,3,4],
          [5,6,7,8],
          [9,10,11,12],
          [13,14,15,16]
          ]


print spiral_order(matrix)



#. 1   2   3
#. 4   5   6
#. 7   8   9
#. 10  11  12
#. 13  14  15
#. 16  17  18
#  19  20  21

# 7/3
