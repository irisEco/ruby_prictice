#48. 旋转图像
# 给定一个 n × n 的二维矩阵 matrix 表示一个图像。请你将图像顺时针旋转 90 度。
#
# 你必须在 原地 旋转图像，这意味着你需要直接修改输入的二维矩阵。请不要 使用另一个矩阵来旋转图像。
#
# 示例 1：
# 输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
# 输出：[[7,4,1],[8,5,2],[9,6,3]]
#
# 示例 2：
# 输入：matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
# 输出：[[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]
#
#
# 提示：
# n == matrix.length == matrix[i].length
# 1 <= n <= 20
# -1000 <= matrix[i][j] <= 1000

# 可以看出规律是 新数组顺序为 第一个元素为 原数组的最后的一位,倒数第二组数组元素的第一位....
# 方法一:,将数组反转,打散为一维数组,再根据n= matrix.length的长度,每隔一段n添加当前值...
# 当添加的数组长度=n时,进行i++,从头开始取值
# 方法二: 直接找规律,将反转数组,数组元素ji位置互换,即是想要的值
def rotate(matrix)
  matrix_new = Array.new(matrix.reverse)
  n = matrix.length
  # 新建一个n*n的二维数组
  data = Array.new(n) {Array.new(n)}
  for j in 0..(n - 1)
    for i in 0..(n - 1)

      data[i][j] = matrix_new[j][i]
    end
  end
  for i in 0..(n - 1)
    for j in 0..(n - 1)
      # 反转之后,ij互换即是需要的值
      matrix[i][j] = data[i][j]
    end
  end
  matrix
end


matrix = [[1,2,3],[4,5,6],[7,8,9]]
result = rotate(matrix)

puts result.to_s