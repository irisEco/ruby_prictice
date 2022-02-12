#53. 最大子序和
#给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
# 示例 1：
# 输入：nums = [-2,1,-3,4,-1,2,1,-5,4]
# 输出：6
# 解释：连续子数组 [4,-1,2,1] 的和最大，为 6 。
#
# 示例 2：
# 输入：nums = [1]
# 输出：1
#
# 示例 3：
# 输入：nums = [0]
# 输出：0
#
# todo
# 思路:在问题中,出现"最,连续"的字眼时,此算法的考察的点大多数是 动态规划,分治法,贪心法,暴力法的求解
# 因为"最"字就意味着需要大量的比较,随着数据越大,时间就消耗的越多.
# 所以动态规划,就是为以空间换时间的算法.
# 暴力法,则是所有穷举,直至比较完毕,时间复杂度为O(n^2)最消耗时间的算法
#
#
# 方法一: 动态规划
# 最优子结构: 将依赖于上一个问题的最大和值 和 当前值比较,如果递减,那么肯定不是最大和值,于是将最大和值初始化为当前值
# 全局最优解: 将上一个最大连续子序列和值和当前所有最大连续子序列和值比较, 选出全局最大的连续子序列值
# def max_sub_array(nums)
#   pre_val = 0 # 上一个最连续和最大的值,初始化为0
#   max_val = nums[0] # 初始化最大值为第一个数,不可为0
#   nums.each do |num|
#     pre_val = [pre_val + num, num].max # 上一个最大连续和的值
#     # 与上一个最大连续和的值做比较,如果当前值大于上一个累加和,最优子问题解是当前值+上一个累加值
#     #  如果当前值小于上一个累加和,则最大值为当前值
#     max_val = [max_val, pre_val].max
#   end
#   return max_val
# end


# 方法二: 贪心算法
# def greed_max_sub_array(nums)
#   pre_val = 0 # 上一个最连续和最大的值,初始化为0
#   max_val = nums[0] # 初始化最大值为第一个数,不可为0
#   nums.each do |num|
#     pre_val = num + [pre_val, 0].max #和动态规划有细微的差别,贪心有最优子问题解策略,这里是为0,一旦不符合则前面的值丢弃
#     # 与上一个最大连续和的值做比较,如果当前值大于上一个累加和,最优子问题解是当前值+上一个累加值
#     #  如果当前值小于上一个累加和,则最大值为当前值
#     max_val = [max_val, pre_val].max
#   end
#   return max_val
# end


# 方法三 分治算法
# 将序列分段,最大值可能出现在左边段,右边段,中间段
# todo
# def divide_max_sub_array(nums, left, right)
#   return nums[left] if left == right
#   middle = (left + right) / 2
#   divide_left_val = divide_max_sub_array(nums, left, middle) # 获取左边段最大值
#   divide_right_val = divide_max_sub_array(nums, middle + 1, right) # 获取右边段最大值
#   left_val = 0
#   right_val = 0
#   max_left = nums[left] # 初始化左边序列最大值为 第一个元素
#   max_right = nums[middle + 1] #初始化右边序列最大值为 右边第一个元素
#   # 获取中间段最大值
#   tab = middle
#   while (tab >= left)
#     left_val = [left_val, nums[tab]].max
#     max_left = [max_left, left_val].max
#     tab -= 1
#   end
#
#   for j in (middle + 1)..right
#     right_val = [right_val, nums[j]].max
#     max_right = [max_right, right_val].max
#   end
#
#   max_val = [divide_left_val, divide_right_val, max_left + max_right].max
#
#   return max_val
# end


nums = [-2,1,-3,4,-1,2,1,-5,4]
len = nums.length - 1
# puts len-1
num = divide_max_sub_array(nums, 0, len)
puts num