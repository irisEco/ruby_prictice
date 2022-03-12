#56. 合并区间
# 以数组 intervals 表示若干个区间的集合，其中单个区间为 intervals[i] = [starti, endi] 。请你合并所有重叠的区间，并返回 一个不重叠的区间数组，该数组需恰好覆盖输入中的所有区间 。

# 示例 1：
# 输入：intervals = [[1,3],[2,6],[8,10],[15,18]]
# 输出：[[1,6],[8,10],[15,18]]
# 解释：区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6].
#
# 示例 2：
# 输入：intervals = [[1,4],[4,5]]
# 输出：[[1,5]]
# 解释：区间 [1,4] 和 [4,5] 可被视为重叠区间。
#
# 提示：
# 1 <= intervals.length <= 104
# intervals[i].length == 2
# 0 <= starti <= endi <= 104
#

# 动态规划:最优子结构,重叠子问题
def merge(intervals)
  # return intervals if intervals.length == 1
  # 按照intervals[i].first 从小到大排序
  # 则temp.first 总会小于 interval.first,所以这部分不需要判断
  intervals_new = Array.new(intervals.sort {|a, b| a <=> b})
  temp = intervals_new[0]
  arr = []
  for i in 1..(intervals_new.length - 1)
    # 如果 第i个元素的最大值 大于 上一个元素的最小值 且 上一个元素的最大值 大于 第i个元素的最大值
    if  temp.last <= intervals_new[i].last && temp.last >= intervals_new[i].first
      temp = [temp.first, intervals_new[i].last]
    elsif  temp.last >= intervals_new[i].last
      temp = temp
    elsif temp.first > intervals_new[i].last || temp.last < intervals_new[i].first
      # 如果遇到不用合并的数组,再追加前面已经合并区间的数组元素到arr数组
      arr.push temp
      temp = intervals_new[i]
    end
  end
  # 追加最后的数组元素
  arr.push temp
  arr.to_s
end

intervals = [[6,7],[2,8],[9,15],[15,18]]
result = merge(intervals)

puts result