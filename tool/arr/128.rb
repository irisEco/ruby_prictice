#128. 最长连续序列
# 给定一个未排序的整数数组 nums ，找出数字连续的最长序列（不要求序列元素在原数组中连续）的长度。
#
# 请你设计并实现时间复杂度为 O(n) 的算法解决此问题。
#
#
#
# 示例 1：
#
# 输入：nums = [100,4,200,1,3,2]
# 输出：4
# 解释：最长数字连续序列是 [1, 2, 3, 4]。它的长度为 4。
# 示例 2：
#
# 输入：nums = [0,3,7,2,5,8,4,6,0,1]
# 输出：9
#
#
# 提示：
#
# 0 <= nums.length <= 105
# -109 <= nums[i] <= 109
# todo 超时
require 'benchmark'

def longest_consecutive(nums)
  return 0 if nums.length == 0
  nums = nums.to_h{|s|[s,s]} # 设置为hash
  tab = 1
  mark = 0
  max_value = nums.values.max
  for i in 0..(nums.length - 1)
    if nums[max_value] - 1 == nums[nums[max_value] - 1]
      tab = tab + 1
    else
      tab = 1
    end
    mark = tab > mark ? tab : mark
    nums.delete(max_value)
    max_value = nums.values.max
  end
  return mark
end


Benchmark.bmbm do |x|
  x.report("longest_consecutive") {
    nums = [1,4,5,2,6,8,9,0,0,3]
    puts 'results: '
    puts longest_consecutive(nums)
    }
end

