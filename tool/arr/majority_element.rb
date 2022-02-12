#给定一个大小为 n 的数组，找到其中的多数元素。多数元素是指在数组中出现次数 大于 ⌊ n/2 ⌋ 的元素。
#
# 你可以假设数组是非空的，并且给定的数组总是存在多数元素。
#
#  
#
# 示例 1：
#
# 输入：[3,2,3]
# 输出：3
# 示例 2：
#
# 输入：[2,2,1,1,1,2,2]
# 输出：2
#
# 思路: 将数组转hash
def majority_element(nums)
  tab = {}
  count = 1
  nums.each do |num|
    # 如果 哈希已经存在相同的key,说明count需要加一
    if tab.has_key?(num)
    tab[num] = tab[num]+1
    else
      tab[num] = count
      end
  end
  len = nums.length/2
  tab = tab.select{|k,v| v > len}.keys
  return tab[0]
end

nums = [3,2,3]
result = majority_element(nums)
puts result


# todo
# 需要学习他人思路
# 双指针
#