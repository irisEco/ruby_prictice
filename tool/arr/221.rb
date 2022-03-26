#221. 最大正方形
# 在一个由 '0' 和 '1' 组成的二维矩阵内，找到只包含 '1' 的最大正方形，并返回其面积。
#
#
#
# 示例 1：
# 输入：matrix = [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]
# 输出：4
#
# 示例 2：
# 输入：matrix = [["0","1"],["1","0"]]
# 输出：1
#
# 示例 3：
# 输入：matrix = [["0"]]
# 输出：0
#
#
# 提示：
# m == matrix.length
# n == matrix[i].length
# 1 <= m, n <= 300
# matrix[i][j] 为 '0' 或 '1'


def maximal_square(matrix)
  return matrix[0][0].to_i if matrix.flatten.uniq.length == 1 && matrix[0][0] == '0'
  dp = Array.new(matrix.length) {Array.new(matrix[0].length) {0}} # 存储矩阵的最小边值,默认最小值为0,非常经典的动态规划要点,声明一个状态矩阵,存储前一个子问题解
  max_side = 1
  for i in 0...(matrix.length)
    for j in 0...(matrix[i].length)
      if matrix[i][j] == '1'
        # 前后,对角线试探,同时为1则边长加1,否则还是1
        # 当前值依赖前一个子问题的解
        # 和其他动态规划不同的是,这个子问题又依赖三个变量
        dp[i][j] = [dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]].min + 1
        max_side = [dp[i][j], max_side].max
      end
    end
  end
  max_side * max_side
end


matrix = [["1", "1", "1", "1", "0"],
          ["1", "1", "1", "1", "1"],
          ["1", "1", "1", "1", "1"],
          ["1", "1", "1", "1", "1"],
          ["0", "1", "1", "1", "1"]]
result = maximal_square(matrix)
puts result