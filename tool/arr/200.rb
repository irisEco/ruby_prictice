#
# 200. 岛屿数量
# 给你一个由 '1'（陆地）和 '0'（水）组成的的二维网格，请你计算网格中岛屿的数量。
#
# 岛屿总是被水包围，并且每座岛屿只能由水平方向和/或竖直方向上相邻的陆地连接形成。
#
# 此外，你可以假设该网格的四条边均被水包围。
#
# 示例 1：
# 输入：grid = [
#   ["1","1","1","1","0"],
#   ["1","1","0","1","0"],
#   ["1","1","0","0","0"],
#   ["0","0","0","0","0"]
# ]
# 输出：1
#
# 示例 2：
# 输入：grid = [
#   ["1","1","0","0","0"],
#   ["1","1","0","0","0"],
#   ["0","0","1","0","0"],
#   ["0","0","0","1","1"]
# ]
# 输出：3
#
#
# 提示：
#
# m == grid.length
# n == grid[i].length
# 1 <= m, n <= 300
# grid[i][j] 的值为 '0' 或 '1'
# 求图连通分量
# 很明显的dfs
# 回溯+递归,只需要判断数组的上下左右相邻的数字是否为1,当为1则标记为true
# i == 1 时, grid[i][j] = 0 时, i++
#
def num_islands(grid)
  return grid[0][0].to_i if grid.flatten.uniq.length <= 1 # 如果全是1或者全是0,二维数组先要展开flatten,再去重
  tab = 0
  for i in 0...grid.length
    for j in 0...grid[i].length
      if grid[i][j] == "1"
        backtrack(grid, i, j)
        tab = tab + 1
      end
    end
  end
  tab
end

def backtrack(gird, i, j)
  # 终止条件,边界问题
  return if i < 0 || j < 0 || i >= gird.length || j >= gird[i].length

  # 如果gird[i][j] = 2说明标记过,为连通岛屿,不做计算, 或者等于0
  return if gird[i][j] != "1"
  gird[i][j] = 2
  backtrack(gird, i, j + 1,)
  backtrack(gird, i, j - 1,)
  backtrack(gird, i + 1, j,)
  backtrack(gird, i - 1, j,)

end


grid = [
    ["1", "1", "0", "1", "0"]
]

result = num_islands(grid)
puts result