#215. 数组中的第K个最大元素
# 给定整数数组 nums 和整数 k，请返回数组中第 k 个最大的元素。
#
# 请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。
#
#
#
# 示例 1:
#
# 输入: [3,2,1,5,6,4] 和 k = 2
# 输出: 5
# 示例 2:
#
# 输入: [3,2,3,1,2,4,5,5,6] 和 k = 4
# 输出: 4
#
#
# 提示：
#
# 1 <= k <= nums.length <= 104
# -104 <= nums[i] <= 104

# 考察排序
# 这里先实现以下快速排序
# 使用双指针滑动技巧
def find_kth_largest(nums, k)
  left = 0
  right = nums.length - 1
  partition(nums, left, right)
  nums
end

def partition(nums, left, right)
  return if left > right
  mark = nums[left]
  l = left
  r = right
  # 哨兵l 哨兵r 没有相遇时
  while (l != r)
    # 必须要哨兵左先
    # 哨兵左移,寻找比基准小的值,遇到时,暂停
    while nums[r] >= mark && r > l
      r = r - 1
    end
    # 哨兵右移,寻找比基准大的值,遇到时,暂停
    while nums[l] <= mark && r > l
      l = l + 1
    end

    # 并且哨兵没过界,交换哨兵的值
    if r > l
      temp = nums[l]
      nums[l] = nums[r]
      nums[r] = temp
    end
  end
  # 哨兵相遇时, 交换基准和哨兵的值
  temp = nums[l]
  nums[l] = nums[left]
  nums[left] = temp
  # 左分区
  partition(nums, left, l - 1)
  # 右分区
  partition(nums, l + 1, right)
end


nums = [1,14,28,46,23,12,1,123]
k = 2
result = find_kth_largest(nums, k)
puts result.to_s

