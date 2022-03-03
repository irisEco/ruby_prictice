#给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
#
# 示例:
# 输入: [0,1,0,3,12]
# 输出: [1,3,12,0,0]
#
# 说明:
# 必须在原数组上操作，不能拷贝额外的数组。
# 尽量减少操作次数。
#
# 思路:本题考查的是队列
#
# 方法一: 直接做数组的操作,不太符合题意,题意是移动0,不可做删除添加
# 1.先获取0的个数
# 2.再把所有0删除
# 3.再在数组尾部追加相应个数的0
# def move_zeroes(nums)
#   tab = nums.select{|i| i==0}.count
#   nums.delete(0)
#   for i in 0 ... tab
#     nums.push 0
#   end
#   return nums
# end


#方法二: 双指针
# 和我一开时的想法很像,但是没有理清楚
#	324 ms	207.3 MB	不可取
def move_zeroes(nums)
  j = 0
  for i in 0...nums.length
    if nums[j] == 0
      nums.delete_at(j)
      nums.push 0
    else

      j += 1
    end
  end
  return nums
end


nums = [0, 1, 0, 3, 12]
result = move_zeroes(nums)
puts result