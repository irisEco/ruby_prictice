#33. 搜索旋转排序数组
# 整数数组 nums 按升序排列，数组中的值 互不相同 。
#
# 在传递给函数之前，nums 在预先未知的某个下标 k（0 <= k < nums.length）上进行了 旋转，使数组变为 [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]]（下标 从 0 开始 计数）。例如， [0,1,2,4,5,6,7] 在下标 3 处经旋转后可能变为 [4,5,6,7,0,1,2] 。
#
# 给你 旋转后 的数组 nums 和一个整数 target ，如果 nums 中存在这个目标值 target ，则返回它的下标，否则返回 -1 。

# 示例 1：
# 输入：nums = [4,5,6,7,0,1,2], target = 0
# 输出：4
#
# 示例 2：
# 输入：nums = [4,5,6,7,0,1,2], target = 3
# 输出：-1
#
# 示例 3：
# 输入：nums = [1], target = 0
# 输出：-1
#
#
# 提示：
# 1 <= nums.length <= 5000
# -10^4 <= nums[i] <= 10^4
# nums 中的每个值都 独一无二
# 题目数据保证 nums 在预先未知的某个下标上进行了旋转
# -10^4 <= target <= 10^4
#

# 题解: 就是寻找数组的的每个值,返回下标,要求时间复杂度O(logn)
# 思路:这种复杂度一般使用二分法,不同的是,二分法适用于有序的数组,而本题不同的是,数组不为有序,但部分有序
# 错误思路: 递归
# def search(nums, target)
#   middle = nums.length / 2
#   if middle > 0
#     for i in 0..middle
#       if target < nums[middle]
#         search(nums[0..middle], target)
#       elsif target > nums[middle]
#         search(nums[middle + 1..nums.length - 1], target)
#       else
#         return nums[i]
#       end
#     end
#   else
#     return [-1]
#   end
# end

def search(nums, target)
  len = nums.length
  return -1 if len == 0
  return nums[0] == target ? 0 : -1 if len == 1
  left = 0
  right = len - 1
  while (right >= left)
    middle = (left + right) / 2
    if nums[middle] == target
      return middle
    end
    # 如果是有序递增,使用二分查找
    if nums[0] <= nums[middle]
      # 如果target在nums[0~middle]中
      if nums[0] <= target && target < nums[middle]
        right = middle - 1
      else
        left = middle + 1
      end
    else
      # 如果不是有序递增
      # target 在num[middle~len-1]之中
      if nums[middle] < target && target <= nums[len - 1]
        left = middle + 1
      else
        right = middle - 1
      end
    end
  end
  return - 1
end

nums = [4, 5, 6, 7, 0, 1, 2]
target = 0
result = search(nums, target)
puts result
