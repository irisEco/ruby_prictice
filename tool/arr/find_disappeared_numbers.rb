#448. 找到所有数组中消失的数字
# 给你一个含 n 个整数的数组 nums ，其中 nums[i] 在区间 [1, n] 内。请你找出所有在 [1, n] 范围内但没有出现在 nums 中的数字，并以数组的形式返回结果。
#
# 示例 1：
# 输入：nums = [4,3,2,7,8,2,3,1]
# 输出：[5,6]
#
# 示例 2：
# 输入：nums = [1,1]
# 输出：[2]
#
#
# 提示：
# n == nums.length
# 1 <= n <= 105
# 1 <= nums[i] <= n
# 进阶：你能在不使用额外空间且时间复杂度为 O(n) 的情况下解决这个问题吗? 你可以假定返回的数组不算在额外空间内。
#
# 错误思路一:
# 1.先将数组排序
# 2.再循环遍历数组,将当前数组第i个元素和i+1对比
# 相等则跳过,不相等则push进数组
# 最后返回
# 错误原因:未考虑数组中存在重复相同的元素
#
# 贪心,动态规划,递归,分治,窗口滑动,双指针
#错误思路二:
#将数组先排序,再循环对比第i个元素和i+1是否相等,不相等的元素组装成哈希list
#再循环list,对比当前key是否在list的value中,不存在则记录key,最后返回
# 结果没有问题,但是超时!!
# def find_disappeared_numbers(nums)
#   arrs = nums.sort
#   list = {}
#   info = []
#   arrs.each_with_index { |arr,i |
#     list[i+1] = arr if arr!=i+1
#   }
#   list.each_key {|k|
#     if !list.has_value?(k)
#       info.push k
#     end
#   }
#   return info
# end

# 方法一:
# 1.将数组中所有的元素累加一个数组长度值
# 2.再循环数组判断元素是否小于数组长度值,小于则说明为缺少的值
# 3.鸽笼原理
#


# 方法二:同方法一,但要考虑数据元素相加数据长度时,是否为溢出
# 1.根据数组中存在的元素去查找索引(索引是从0开始,所以元素-1则,相对num[0]=0)
# 2.再将查找到的索引的当前元素值,标记为负数
# 3.存在未出现的元素时,就不会去找相应的索引,所以不会被标记为负数
# 4.将正数筛选出来既可

def find_disappeared_numbers(nums)
  len = nums.length
  data = []
  for i in 0...len
    index = (nums[i].abs - 1).abs
    nums[index] = -1 * nums[index].abs
  end
  nums.each_with_index do |num, i|
    if num > 0
      data.push i + 1
    end
  end
  data
end


nums = [4, 3, 2, 7, 8, 2, 3, 1]
result = find_disappeared_numbers(nums)
puts result