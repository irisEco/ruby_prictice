# 3.无重复字符的最长子串
# 主要考察:窗口滑动技巧,散列
# 窗口函数:
def length_of_longest_substring(s)
  return 0 if s.empty?
  size = s.length
  return 1 if size == 1
  left = 0 # 滑动窗口的起始值
  right = 0 # 滑动窗口的结束值
  longest = 0 # 预设最大值
  # 当结束值小于字符串的长度
  # 判断字符串的下一个值是否包含在滑动窗口内
  # 是,则将滑动窗口左边右移至重复字符的位置,并记录当前的最大重复子串的长度
  # 否,则将滑动窗口右边右移一位,将当前最大重复子串的长度+1
  # 初始化最大子串为 0,子串的长度为右边指针-左边指针+1
  while right + 1 < size
    if s[left..right].include?(s[right + 1])
      left += 1
    else
      right += 1
    end
    tmp = right - left + 1
    longest = tmp > longest ? tmp : longest
  end
  return longest
end


a = length_of_longest_substring("abvbbbb")
puts a


# 解法二
# def length_of_longest_substring(s)
#   max = 0
#   curr_arr = []
#   s.each_char do |c|
#     if curr_arr.include?(c)
#       index = curr_arr.index(c) # 获取当前数组包含变量c的元素索引
#       curr_arr.slice!(0..index) # slice! 将数组切片并且返回新的数组,这里是将遇到重复字符的前部分数组切片丢掉
#     end
#     curr_arr << c
#     max = curr_arr.length > max ? curr_arr.length : max
#   end
#   return max
# end