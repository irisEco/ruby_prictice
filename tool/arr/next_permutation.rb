#31. 下一个排列
# 实现获取 下一个排列 的函数，算法需要将给定数字序列重新排列成字典序中下一个更大的排列（即，组合出下一个更大的整数）。
# 如果不存在下一个更大的排列，则将数字重新排列成最小的排列（即升序排列）。
# 必须 原地 修改，只允许使用额外常数空间。
#
# 示例 1：
# 输入：nums = [1,2,3]
# 输出：[1,3,2]
#
# 示例 2：
# 输入：nums = [3,2,1]
# 输出：[1,2,3]
#
# 示例 3：
# 输入：nums = [1,1,5]
# 输出：[1,5,1]
#
# 示例 4：
# 输入：nums = [1]
# 输出：[1]

# 错误思路: 题意是nums=[1,2,3] ,由这三个数组成的所有数,从小到大全排列后,比123下个更大的数
# 而如果当前是最大的数,那么下一位数则是最小的数
# 想到了循环链表...
# 然而不要那么复杂,还是全排列,双指针的使用
# 不可从前往后找,因为要保持下一个更大排列,从前往后找,不能保证有序更大
# def next_permuation(nums)
#   return nums if nums.size <= 1
#   # 左窗口
#   for i in 0...nums.length - 1
#     # 如果遇到了当前数 大于下一位数的情况(本来是升序)
#     j = nums.length - 1
#     if nums[i] < nums[i+1]
#     while (j > i)
#       if nums[j] > nums[i] && nums[i] >= nums[i - 1] && j>=0 && i>=0
#         swap = nums[i]
#         nums[i] = nums[j]
#         nums[j] = swap
#       end
#       j = j - 1
#     end
#     nums[i..j] = nums[i..j].sort
#     else
#     nums[i..j] = nums[i..j].sort
#     end
#     end
#
#   return nums
# end

# 思路: 要保证有序更大,说明要保证交换的最大数和最小数尽量在右侧
#
def next_permutation(nums)
  return nums if nums.size <= 1 # 如果nums的数量小于1,则返回
  i = nums.length - 2 # i为左侧指针,j为右侧指针
  # 当 i 大于第一个数时
    # 如果数组是降序的,说明已经是最大序列了,没有的话,说明是升序
  # 这里nums[i] 要和 nums[i+1]比较,why??,如果是和nums[i-1]比较,则每个数都往左边比较了,会去交换高位的数!
    while (i >= 0 && nums[i] >= nums[i + 1])
      i = i - 1
    end
  # 当数组不是最大排序,即降序时
  if i >= 0
    j = nums.length - 1
    # 当右指针大于左指针时,不必交换,此时为部分降序
    while (j>= 0 && nums[i] >= nums[j])
      j = j - 1
      end
      swap = nums[i]
      nums[i] = nums[j]
      nums[j] = swap
    end
    # 全部比较完,或者最大序列
    nums[i+1...nums.length] = nums[i+1...nums.length].reverse
  return nums
end


nums = [1, 2, 1, 4]
result = next_permutation(nums)
puts result