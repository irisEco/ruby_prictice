#287. 寻找重复数
# 给定一个包含 n + 1 个整数的数组 nums ，其数字都在 [1, n] 范围内（包括 1 和 n），可知至少存在一个重复的整数。
#
# 假设 nums 只有 一个重复的整数 ，返回 这个重复的数 。
#
# 你设计的解决方案必须 不修改 数组 nums 且只用常量级 O(1) 的额外空间。
#
#
#
# 示例 1：
#
# 输入：nums = [1,3,4,2,2]
# 输出：2
# 示例 2：
#
# 输入：nums = [3,1,3,4,2]
# 输出：3
#
#
# 提示：
#
# 1 <= n <= 105
# nums.length == n + 1
# 1 <= nums[i] <= n
# nums 中 只有一个整数 出现 两次或多次 ，其余整数均只出现 一次
# 错误思路:题目要求不能修改原数组
# def find_duplicate(nums)
#   nums = nums.sort
#   for i in 0...nums.length
#     if nums[i] == nums[i + 1]
#       return nums[i]
#     end
#   end
# end

# 快慢指针:一个浪漫的算法技巧
# 数组只读,不能修改数组,排序
# 时间复杂度小于 O(n^2),不能暴力
# 空间复杂度O(1) 不能有额外数组开销
def find_duplicate(nums)

end
nums = [3,1,3,4,2]

result = find_duplicate(nums)
puts result
