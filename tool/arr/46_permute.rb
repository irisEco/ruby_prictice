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
# 求所有值,一般为暴力搜索
# 重点: 在树的遍历时,需要回溯
def permute(nums)
  arr = []
  backtrack(nums, 0, [], arr)
end

def backtrack(nums, i, data, arr)
  # 如果当前长度和数组长度相等,则进行下一个循环
  if data.length == nums.length
    arr.push Array.new(data)
    return
  end

  for j in 0..(nums.length - 1)
    # 如果当前数组中包含元素则跳过
    if !data.include?(nums[j])
      # 当不存在当前元素时,追加到当前数组中
      data.push nums[j]
      backtrack(nums, j, data, arr)
      # 回溯
      data.pop
    end
  end
  arr
end

nums = [1, 2, 3]
result = permute(nums)
puts result.to_s