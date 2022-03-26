#238. 除自身以外数组的乘积
# 给你一个整数数组 nums，返回 数组 answer ，其中 answer[i] 等于 nums 中除 nums[i] 之外其余各元素的乘积 。
#
# 题目数据 保证 数组 nums之中任意元素的全部前缀元素和后缀的乘积都在  32 位 整数范围内。
#
# 请不要使用除法，且在 O(n) 时间复杂度内完成此题。
#
#
#
# 示例 1:
#
# 输入: nums = [1,2,3,4]
# 输出: [24,12,8,6]
# 示例 2:
#
# 输入: nums = [-1,1,0,-3,3]
# 输出: [0,0,9,0,0]
#
#
# 提示：
#
# 2 <= nums.length <= 105
# -30 <= nums[i] <= 30
# 保证 数组 nums之中任意元素的全部前缀元素和后缀的乘积都在  32 位 整数范围内
#
#
# 进阶：你可以在 O(1) 的额外空间复杂度内完成这个题目吗？（ 出于对空间复杂度分析的目的，输出数组不被视为额外空间。
#
#
#
# 我服了这个老6之脑筋急转弯题
# 左右乘积列表
# 利用左侧所有数字的乘积和在右侧所有数字的乘积相城
def product_except_self(nums)
  arr = []
  len = nums.length - 1
  left = Array.new()
  left[0] = 1
  right = Array.new()
  right[len] = 1
  i = len - 1
  for j in 1...nums.length
    left[j] = left[j - 1] * nums[j - 1]
  end
  while i >= 0
    right[i] = right[i + 1] * nums[i + 1]
    i = i - 1
  end
  for k in 0..len
    arr[k] = left[k]*right[k]
  end
  arr
end

nums = [1, 2, 3, 4]
result = product_except_self(nums)
puts result