#18. 四数之和
# 给你一个由 n 个整数组成的数组 nums ，和一个目标值 target 。请你找出并返回满足下述全部条件且不重复的四元组 [nums[a], nums[b], nums[c], nums[d]] （若两个四元组元素一一对应，则认为两个四元组重复）：
#
# 0 <= a, b, c, d < n
# a、b、c 和 d 互不相同
# nums[a] + nums[b] + nums[c] + nums[d] == target
# 你可以按 任意顺序 返回答案 。
# 示例 1：
# 输入：nums = [1,0,-1,0,-2,2], target = 0
# 输出：[[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
#
# 示例 2：
# 输入：nums = [2,2,2,2,2], target = 8
# 输出：[[2,2,2,2]]

#思路:
# todo :有重复和缺少的值
# def four_sum(nums, target)
#   quadruplets = []
#   return quadruplets if nums.nil? || nums.length < 4
#   nums = nums.sort
#   len = nums.length
#   for i in 0...len - 3
#     next if i > 0 && nums[i] == nums[i - 1]
#     # break if nums[i] + nums[i + 1] + nums[i + 2] + nums[i + 3] > target
#     # next if nums[i] + nums[len - 1] + nums[len - 2] + nums[len - 3] < target
#     for j in i + 1...len - 2
#       next if j > i + 1 && nums[j] == nums[j - 1]
#       # break if nums[i] + nums[j] + nums[j + 1] + nums[j + 2] > target
#       # next if nums[i] + nums[j] + nums[len - 2] + nums[len - 1] < target
#       left = j + 1
#       right = len - 1
#       while (left < right)
#         sum = nums[i] + nums[j] + nums[left] + nums[right]
#         if sum == target
#           quadruplets.push [nums[i], nums[j], nums[left], nums[right]]
#           left = left + 1 until left >= right || nums[left] != nums[left - 1]
#           left = left + 1
#           right = right - 1 until left >= right || nums[right] != nums[right + 1]
#           right = right - 1
#         elsif sum < target
#           left = left + 1
#         elsif sum > target
#           right = right - 1
#         end
#       end
#     end
#   end
#   return quadruplets
# end




nums = [-3,-2,-1,0,0,1,2,3]
target = 0
result = four_sum(nums, target)
puts result