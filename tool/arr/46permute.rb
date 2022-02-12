#46. 全排列
# 给定一个不含重复数字的数组 nums ，返回其 所有可能的全排列 。你可以 按任意顺序 返回答案。
#

# 示例 1：
# 输入：nums = [1,2,3]
# 输出：[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
#
# 示例 2：
# 输入：nums = [0,1]
# 输出：[[0,1],[1,0]]
#
# 示例 3：
# 输入：nums = [1]
# 输出：[[1]]

# 思路一: 相与求值,但不满足排列数组只有一个元素的情况
#
def permute(nums)
  result = []
  for i in 0...nums.length
    arr = []
    arr.push nums[i]
    for j in 0...nums.length
      if nums[i] != nums[j]
      arr.push nums[j]
      end
      for k in 0...nums.length
        if nums[i] != nums[j] && nums[j] != nums[k]
        arr.push nums[k]
        end
      end
    end
    result.push arr
  end
  result
end

nums = [1, 2, 3]
result = permute(nums)
puts result