#240. 搜索二维矩阵 II
# 编写一个高效的算法来搜索 m x n 矩阵 matrix 中的一个目标值 target 。该矩阵具有以下特性：
#
# 每行的元素从左到右升序排列。
# 每列的元素从上到下升序排列。
#
#
# 示例 1：
#
#
# 输入：matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 5
# 输出：true
# 示例 2：
#
#
# 输入：matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 20
# 输出：false
#
#
# 提示：
#
# m == matrix.length
# n == matrix[i].length
# 1 <= n, m <= 300
# -109 <= matrix[i][j] <= 109
# 每行的所有元素从左到右升序排列
# 每列的所有元素从上到下升序排列
# -109 <= target <= 109
#

require 'benchmark'

# 二分查找
# 我的思路是参照二维数组的中心点,将矩阵分为四个小块,再迭代比较,但是这个思路写法比较绕,且复杂度不低,暂不写
# 目前解法思路: 将二维数组转化为一维数组,再二分搜索
def search_matrix(matrix, target)
  m = matrix.length
  n = matrix[0].length
  return false if m == 0 || n == 0 # 判断二维数组长度是否为0
  for i in 0...m
    # 先判断 target是否和每行的第一个值相等
    if target == matrix[i][0]
      return true
    end
    # 如果目标值比每一行的最小值都小,那么肯定不在矩阵中
    if target < matrix[i][0]
      break
    end
    if target > matrix[i][n - 1]
      next
    end
    # if matrix[i][0] < target && target < matrix[i][n - 1] 多余的判断,前面已经有边界判断
    result = binary_search(matrix[i], target)
    # end
    if result != -1
      return true
    end
  end
  return false
end


# 二分法模板
def binary_search(m, target)
  right = m.length - 1
  left = 0
  while left <= right ##一定要判断相等,否则边界判断不到
    middle = (left + right) / 2 #二分
    if target == m[middle]
      return true
    elsif target < m[middle]
      right = middle - 1
    elsif target > m[middle]
      left = middle + 1
    end
  end
  -1
end

# 散列查找,超时,将二维转为一维,再转成hash
# def search_matrix(matrix, target)
#   matrix.flatten.to_h{|h|[h.ord,h]}.value?(target)
# end

Benchmark.bmbm do |x|
  x.report("search_matrix") {
    matrix = [[1, 4, 7, 11, 15], [2, 5, 8, 12, 19], [3, 6, 9, 16, 22], [10, 13, 14, 17, 24], [18, 21, 23, 26, 30]]
    target = 20
    puts search_matrix(matrix, target)
  }
end