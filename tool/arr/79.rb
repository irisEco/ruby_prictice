#79. 单词搜索
# 给定一个 m x n 二维字符网格 board 和一个字符串单词 word 。
# 如果 word 存在于网格中，返回 true ；否则，返回 false 。
# 单词必须按照字母顺序，通过相邻的单元格内的字母构成，其中“相邻”单元格是那些水平相邻或垂直相邻的单元格。
# 同一个单元格内的字母不允许被重复使用。
#
# 示例 1：
# 输入：board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
# 输出：true
#
# 示例 2：
# 输入：board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "SEE"
# 输出：true
#
# 示例 3：
# 输入：board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCB"
# 输出：false
#
#
# 提示：
# m == board.length
# n = board[i].length
# 1 <= m, n <= 6
# 1 <= word.length <= 15
# board 和 word 仅由大小写英文字母组成

# 深度优先搜索+回溯
#
# 定义上下左右四个行走方向
# 方法一
# @directs = [[0, 1], [0, -1], [1, 0], [-1, 0]]
#
#   def exist(board, word)
#   return false if !(board.flatten.to_set >= word.split('').to_set)
#     word_list = word.split('')
#     mark = Array.new(board.length) {Array.new(board[0].length)}
#     for i in 0..(board.length - 1)
#       for j in 0..(board[0].length - 1)
#         # 先找出第一个元素的位置
#         if board[i][j] == word_list[0]
#           #标记已使用
#           mark[i][j] = 1
#           if backtrack(board, word_list[1..], i, j, mark)
#             return true
#           else
#             # 回溯
#             mark[i][j] = 0
#           end
#         end
#       end
#     end
#     return false
#   end
#
#
#   def backtrack(board, word_list, i, j, mark)
#     return true if word_list.length == 0
#
#     @directs.each_with_index do |dire|
#       cur_i = i + dire[0]
#       cur_j = j + dire[1]
#
#       if cur_i >= 0 && cur_i < board.length && cur_j >= 0 && cur_j < board[0].length && board[cur_i][cur_j] == word_list[0]
#         # 忽略 已经使用过的元素
#         if mark[cur_i][cur_j] == 1
#           next
#         end
#         mark[cur_i][cur_j] = 1
#         if backtrack(board, word_list[1..], cur_i, cur_j, mark)
#           return true
#         else
#           # 回溯
#           mark[cur_i][cur_j] = 0
#         end
#       end
#     end
#     return false
#   end

# @todo 结果没问题,超时
def exist(board, word)
  # 将二维数组展开为一维数组,转换成无重复的集合类型,比较两者的size,
  # 如果需要匹配的字符串size比二维数组size大,那么必然不可能匹配成功
  return false if !(board.flatten.to_set >= word.split('').to_set)
  word = word.split('')
  for i in 0...board.length
    for j in 0...board[0].length
      # 从字符串的首字母开始查询
      if backtrack(board, word, i, j, 0)
        return true
      end
    end
  end
  return false
end

def backtrack(board, word, i, j, d)
  return false if i < 0 || i >= board.length || j < 0 || j >= board[0].length || board[i][j] != word[d] # 超出网格范围,或者当前网格元素和字符串不匹配,返回false
  return true if d == (word.length - 1) #当查找到字符串的末尾截止递归查询, 这里需要先判断最后一个字符是否匹配网格元素,再判断是否截止递归
  # 当前网格元素和字符匹配
  # 标记当前网格元素,已被使用
  mark = board[i][j]
  board[i][j] = 0
  # 根据上下左右移动网格元素来匹配下一个字符
  result = backtrack(board, word, i + 1, j, d + 1) || backtrack(board, word, i - 1, j, d + 1) || backtrack(board, word, i, j + 1, d + 1) || backtrack(board, word, i, j - 1, d + 1)
  board[i][j] = mark
  return result
end


board = [["A", "B", "C", "E"], ["S", "F", "C", "S"], ["A", "D", "E", "E"]]
word = "SEE"
result = exist(board, word)
puts result