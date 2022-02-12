#121. 买卖股票的最佳时机
# 给定一个数组 prices ，它的第 i 个元素 prices[i] 表示一支给定股票第 i 天的价格。
# 你只能选择 某一天 买入这只股票，并选择在 未来的某一个不同的日子 卖出该股票。
# 设计一个算法来计算你所能获取的最大利润。
# 返回你可以从这笔交易中获取的最大利润。如果你不能获取任何利润，返回 0 。
#
# 示例 1：
# 输入：[7,1,5,3,6,4]
# 输出：5
# 解释：在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
#      注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格；同时，你不能在买入前卖出股票。
#
# 示例 2：
# 输入：prices = [7,6,4,3,1]
# 输出：0
# 解释：在这种情况下, 没有交易完成, 所以最大利润为 0。

# 方法:动态规划
# 1.如果当前元素-下一个元素的差值大于0时,当前最大利润为0
# 1.如果当前元素-下一个元素的差值小于0时,当前最大利润为差值
#
# 错误思路一:
# 1.将数组中最大最小元素找出来
# 2.再比较两者的索引
# 3.如果最大值的索引<最小值的索引,则删除最大元素的索引所在的值
# 不断递归,直至数组长度小于1
# 错误点在于,只适用于最大值永远在最小值的左边,也就是说,数组是降序排序的情况下,可以
# 而在数组元素先递增后递减的情况下不满足,比如[2,4,1]
#
# 错误思路二:我们应该将最大值标记,最大值之后的元素全部砍掉,只比较左边部分到最大值部分
# 这个不满足[7,1,5,3,6,4]
# def max_profit(prices)
#   max_val = 0
#   max_index = 0
#   min_val = Float::INFINITY
#   min_index = 0
#   prices.each_with_index do |price, index|
#     if price >= max_val
#       max_val = price
#       max_index = index
#     end
#     if price <= min_val
#       min_val = price
#       min_index = index
#     end
#   end
#   if max_index > min_index
#     return max_val - min_val
#   else
#     prices.delete_at(max_index)
#     if prices.length > 1
#       max_profit(prices)
#     else
#       return 0
#     end
#   end
# end

# 方法一
# 思路:要找出最大利润,只要先找出最小值,再找出每天和这个最小值的差值最大既可
# 1.初始化最大值为0,保证每天的价格都比最大值大,则覆盖为最大值
# 2.初始化最小值为无穷大,保证当天的价格比最小值小,则覆盖为最小值
# 3.除了最低点那天,不存在比它小的那天,所以先找出最小价格的那天
# 4.如果出现第i天的价格比最小价格大,说明没有亏损,有盈利,当天利润为当天的价格-最小价格
# 5.再将当天利润和初始化的最大利润(0)对比
# 6.如果当天利润超出了最大利润,那么覆盖给最新最大利润
def max_profit(prices)
  max_val = 0
  min_val = Float::INFINITY
  prices.each_with_index do |price, index|
    if price < min_val
      min_val = price
    elsif (price - min_val) > max_val
      max_val = price - min_val
    end
  end
  max_val
end


prices = [7, 1, 5, 3, 6, 4]
result = max_profit(prices)
puts result

