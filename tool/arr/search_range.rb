#34. 在排序数组中查找元素的第一个和最后一个位置
# 给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。
#
# 如果数组中不存在目标值 target，返回 [-1, -1]。
#
# 进阶：
#
# 你可以设计并实现时间复杂度为 O(log n) 的算法解决此问题吗？
#
#
# 示例 1：
# 输入：nums = [5,7,7,8,8,10], target = 8
# 输出：[3,4]
#
# 示例 2：
# 输入：nums = [5,7,7,8,8,10], target = 6
# 输出：[-1,-1]
#
# 示例 3：
# 输入：nums = [], target = 0
# 输出：[-1,-1]
#
# 思路: 双指针
# 官方思路是 二分法
def search_range(nums, target)
  return [-1, -1] if nums.empty?
  len = nums.length
  right = len - 1
  left = 0
  result = [-1, -1]
  i = 0
  while (i < len)
    if nums[left] == target
      result[0] = left
      # 如果第一个元素找到后,将指针移出数组最大范围
      left = len + 1
    end
    left = left + 1

    if nums[right] == target
      result[1] = right
      # 如果第二个元素找到后,将指针移出数组最小范围
      right = 0 - len
    end
    right = right - 1
    i = i + 1
  end
  result
end

nums = [5, 7, 7, 8, 8, 10]
target = 8

result = search_range(nums, target)
puts result