#15. 三数之和
# 给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有和为 0 且不重复的三元组。
#
# 注意：答案中不可以包含重复的三元组。
# 示例 1：
# 输入：nums = [-1,0,1,2,-1,-4]
# 输出：[[-1,-1,2],[-1,0,1]]
#
# 示例 2：
# 输入：nums = []
# 输出：[]
#
# 示例 3：
# 输入：nums = [0]
# 输出：[]


# 思路:排序+双指针
# 主要是去重
def three_sum(nums)
  len = nums.length - 1
  return [] if nums.empty? || len < 2
  return [] if nums[0] > 0 || nums[-1] < 0
  nums = nums.sort
  data = []
  i = 0
  while i <  nums.length
    break if nums[i] > 0
    left = i + 1
    right = len
    # 当左右指针永不相交时
    while left < right
      sum = nums[i] + nums[left] + nums[right]
      if sum == 0
        data.push [nums[i], nums[left], nums[right]]
        left = left + 1
        left = left + 1 until nums[left] != nums[left - 1] # 和前面走过的比较,去重

        right = right - 1
        right = right - 1 until nums[right] != nums[right + 1]
      elsif sum < 0
        left = left + 1
      elsif sum > 0
        right = right - 1
      end
    end
    i += 1
    i += 1 until nums[i] != nums[i-1] # 去掉重复的比较
    end
    return data
end

# def three_sum(nums)
#   return [] if nums.nil? || nums.empty? || nums.length < 3
#   nums = nums.sort
#   return [] if nums[0] > 0 || nums[-1] < 0
#
#   result = []
#   i = 0
#
#   while i < (length = nums.length)
#     break if nums[i] > 0
#     l_index, r_index = i + 1, length - 1
#
#     while l_index < r_index
#       sum = nums[i] + nums[l_index] + nums[r_index]
#       if sum == 0
#         result.push([nums[i], nums[l_index], nums[r_index]])
#         l_index += 1
#         l_index += 1 until nums[l_index] != nums[l_index-1]
#         r_index -= 1
#         r_index -= 1 until nums[r_index] != nums[r_index+1]
#       elsif sum > 0
#         r_index -= 1
#       elsif sum < 0
#         l_index += 1
#       end
#     end
#     i += 1
#     i += 1 until nums[i] != nums[i-1]
#   end
#   result
# end

nums = [-2,0,1,1,2]
result = three_sum(nums)
puts result