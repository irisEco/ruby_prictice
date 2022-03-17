#75. 颜色分类
# 给定一个包含红色、白色和蓝色、共 n 个元素的数组 nums ，原地对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。
#
# 我们使用整数 0、 1 和 2 分别表示红色、白色和蓝色。
#
# 必须在不使用库的sort函数的情况下解决这个问题。
#
# 示例 1：
# 输入：nums = [2,0,2,1,1,0]
# 输出：[0,0,1,1,2,2]
#
# 示例 2：
# 输入：nums = [2,0,1]
# 输出：[0,1,2]
#
#
# 提示：
# n == nums.length
# 1 <= n <= 300
# nums[i] 为 0、1 或 2
#
# 思路: 将所有0插入数组头部,2插入数组尾部
# 注意点: 对原数组做插入删除操作时,会将元素的索引打乱了
# 1. 先将所有0排在数组前,并将原位置数组元素删除,记录0的个数
# 2. 将数组从最后一个0 的位置开始插入数组元素为1的数组元素,并删除原来数组
# 3. 数组头部插入一个元素时, 原来为i的索引指向的是它对应的上一个元素,所以删除时需要+1
# 单指针
def sort_colors(nums)
  n = nums.length - 1
  p = 0
  for i in 0..n
    if nums[i] == 0
      nums.insert(p, nums[i])
      nums.delete_at(i + 1)
      p = p + 1
      end
  end
  for j in p..n
    if nums[j] == 1
      nums.insert(p, nums[j])
      nums.delete_at(j + 1)
    end
  end
  nums
end

nums = [2,0,2,1,1,0]
result = sort_colors(nums)

puts result.to_s