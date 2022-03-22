#152. 乘积最大子数组
# 给你一个整数数组 nums ，请你找出数组中乘积最大的非空连续子数组（该子数组中至少包含一个数字），并返回该子数组所对应的乘积。
#
# 测试用例的答案是一个 32-位 整数。
#
# 子数组 是数组的连续子序列。
#
# 示例 1:
# 输入: nums = [2,3,-2,4]
# 输出: 6
# 解释: 子数组 [2,3] 有最大乘积 6。
# 示例 2:
# 输入: nums = [-2,0,-1]
# 输出: 0
# 解释: 结果不能为 2, 因为 [-2,-1] 不是子数组。
#
#
# 提示:
#
# 1 <= nums.length <= 2 * 104
# -10 <= nums[i] <= 10
# nums 的任何前缀或后缀的乘积都 保证 是一个 32-位 整数
#
# 动态规划
# 注意点: 当数组中含有一个负数或者多个负数时,需要特殊处理
# 当存在负数时,最大值会变成最小值,最小值会变成最大值
#  乘积最大的非空连续子数组
#
# 整型的最大值和最小值
N_BYTES = [42].pack('i').size
N_BITS = N_BYTES * 16
MAX = 2 ** (N_BITS - 2) - 1
MIN = -MAX - 1

def max_product(nums)
  return nums[0] if nums.length == 1
  max_value = 1
  min_value = 1
  # 设max为数组中的最小值,那么数组中无论谁和它比,都是最大值;也可设置为MIN
  max = nums.min
  #[2,3,-2,4]
  for i in 0..(nums.length - 1)
    # 如果小于0,则将最大值和最小值交换
    if nums[i] < 0
      temp = max_value
      max_value = min_value
      min_value = temp
    end
    # 注意:此处是nums[i],而不是max_value,题目所求连续子数组,而不是所有子数组
    max_value = [nums[i], max_value * nums[i]].max
    min_value = [nums[i], min_value * nums[i]].min
    max = [max, max_value].max
  end
  max
end

nums = [2,3,-2,4,5,6,-4,7,2,-8,-9,1,4,5]
result = max_product(nums)
puts result
