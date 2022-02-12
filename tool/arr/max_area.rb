#输入：[1,8,6,2,5,4,8,3,7]
# 输出：49
# 解释：图中垂直线代表输入数组 [1,8,6,2,5,4,8,3,7]。在此情况下，容器能够容纳水（表示为蓝色部分）的最大值为 49。
# 示例 2：
#
# 输入：height = [1,1]
# 输出：1
# 示例 3：
#
# 输入：height = [4,3,2,1,4]
# 输出：16
# 示例 4：
#
# 输入：height = [1,2,1]
# 输出：2
#
# 提示：
#
# n == height.length
# 2 <= n <= 105
# 0 <= height[i] <= 104

# 题意很简单求最大面积,i*j,在题中i和j都是需要全部遍历,求最大最小基本可以确定考察dp
# dp
# def max_area(height)
#   len = height.length
#   pre_val = 0
#   max_val = [height[0], height[len-1]].min * (len)
#   for i  in 0..height.length-2
#     area = [height[i], height[i + 1]].min * (i+1)
#     pre_val = [area, pre_val].max
#     max_val = [max_val, pre_val].max
#   end
#   return max_val
#   while len > 0
#     max_val = [height[0], height[len-1]].min * (len)
#     len = - 1
#   end
#
# end

# 正确思路:
# 满足dp的需要的条件是1.满足最小问题2.根据最小问题的解找最优解
# 而本题不满足最小问题,无法单方面使用一个变量构造最小最优解
# 考察点是:双向指针,滑动窗口
# 移动短指针的目的是因为 容器的大小不由最高的宽决定而是最短的宽决定
def max_area(height)
  len = height.length
  min_v = 0
  max_v = len - 1
  max_a = 0
  while (min_v < max_v)
    area = [height[min_v], height[max_v]].min * (max_v - min_v)
    max_a = area > max_a ? area : max_a
    if height[min_v] < height[max_v]
      min_v = min_v + 1
    else
      max_v = max_v - 1
    end
    end
    return max_a
  end

  height = [1,8,6,2,5,4,8,3,7]
  result = max_area(height)
  puts result