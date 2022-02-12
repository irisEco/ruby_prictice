#136. 只出现一次的数字
# 给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。
#
# 说明：
# 你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？
# 示例 1:
# 输入: [2,2,1]
# 输出: 1
#
# 示例 2:
# 输入: [4,1,2,1,2]
# 输出: 4


# 方法一:
# 1.遍历数组,建立哈希表,记录每个元素出现的次数
# 2.再寻找次数为1的元素
# def single_number(nums)
#   arr = {}
#   count = 1
#   nums.each do |num|
#     if arr.has_key?(num)
#     arr[num] += count
#     else
#       arr[num] = count
#     end
#   end
#   return arr.key(1)
# end

# 方法二:
# 1.遍历数组,建立哈希表,记录每个元素出现的次数,并同时删除已经存在的的键值对(就是说这个元素出现次数不为一)
# 2.返回hash中的仅有的数据
# def single_number(nums)
#   arr = {}
#   count = 1
#   nums.each do |num|
#     if arr.has_key?(num)
#       arr.delete(num)
#     else
#       arr[num] = count
#     end
#   end
#   return arr.key(1)
# end


# 方法三
# 1.利用异或位运算(相同取0,不同取1)
# 2.返回为1的元素
# 异或运算满足: a^a = 0, a^b^a = b^a^a=b,
def single_number(nums)
  tab = 0
  nums.each do |num|
    tab ^= num
  end
  tab
end

nums = [4,1,2,1,2,5,4]
result = single_number(nums)
puts result