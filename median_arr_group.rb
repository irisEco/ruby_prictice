# 4. 寻找两个正序数组的中位数
# 给定两个大小分别为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。
# 请你找出并返回这两个正序数组的 中位数 。
def find_median_sorted_arrays(nums1, nums2)
  arr = nums1.concat(nums2).sort
  size = arr.length
  return size % 2 == 0 ? (arr[(size - 1) / 2.0] + arr[(size - 1) / 2.0 + 1]) / 2.0 :  arr[(size) / 2.0]
end

info = find_median_sorted_arrays([1,3], [2,4])
puts info