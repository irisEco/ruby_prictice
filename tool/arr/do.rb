def rotate(matrix)
  matrix_new = Array.new(matrix.reverse)
  n = matrix.length
  data = Array.new(n) {Array.new(n)}
  for j in 0..(n - 1)
    for i in 0..(n - 1)
      data[i][j] = matrix_new[j][i]
    end
  end
  for i in 0..(n - 1)
    for j in 0..(n - 1)
      matrix[i][j] = data[i][j]
    end
  end
  matrix
  end


  matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  result = rotate(matrix)

  puts result.to_s