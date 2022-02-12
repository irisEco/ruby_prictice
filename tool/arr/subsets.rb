#78. 子集
# 给你一个整数数组 nums ，数组中的元素 互不相同 。返回该数组所有可能的子集（幂集）。
# 解集 不能 包含重复的子集。你可以按 任意顺序 返回解集。
#
#
#
# 示例 1：
# 输入：nums = [1,2,3]
# 输出：[[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]
#
# 示例 2：
# 输入：nums = [0]
# 输出：[[],[0]]

# 思路:回溯算法,通用解决办法,是一个系统性又带有跳跃性的搜索算法,基本思想是先尝试看符不符合要求,符合就继续,不符合就退回
# result = []
# n = 0
# def subsets(nums)
#   result = []
#   n = nums.length
#   for k in 0..n
#     backtrack(0,k,[],nums)
#   end
#   return result
# end
#
# def backtrack(start,k,cur,nums)
#   if k == 0
#     result.push(cur)
#     return
#   end
#   for i in start...n
#     cur.push nums[i]
#     backtrack(i+1,k-1,cur,nums)
#     cur.delete(cur.size - 1)
#   end
#
# end

#思路一:迭代法实现子集枚举
# 这个思路很绝,首先我们算出子集合的数量,幂集即2的n次方.
# 用1,0来分别表示存在子集中,不存在子集中
# 如[1,2,3]都存在的情况下,为111,即8
# 如[1,3]的情况下,为101,为7
# 所以数组都存在的情况下,刚刚好是它的幂集
# 那么所有的情况我们可以将当前的幂集数转为二进制和当前数组中的元素索引转为二进制,相与
# 如果相等,则将当前数组元素推入数组中,直至幂集数为0,全部比较完毕
# def subsets(nums)
#   n = nums.length
#   mask = 0
#   arr = []
#   sum = 1 << n #所有子集合的数量
#   while mask < sum
#     mask = mask + 1
#     t = []
#     i = 0
#     while i < n
#       tab = 1 << i
#       flag = mask & tab
#       if flag!=0
#         t.push nums[i]
#       end
#       i = i + 1
#     end
#     arr.push t
#   end
#   return arr
# end


# 错误思路
# def subsets(nums)
#   return if nums.empty?
#   result = []
#   len = nums.length
#   k = 1
#   while k <= len
#     arr = []
#     for i in 0...len
#       if arr.length < k
#         arr.push nums[i]
#         for j in i...len
#           if arr.length <= k
#           arr.push nums[j]
#           end
#         end
#       end
#       result.push arr
#     end
#     k = k + 1
#   end
#   return result
# end

def subsets(nums)
  t = []
  ans = []
  dfs(0, nums, t, ans)
  return ans
end

def dfs(cur, nums, t, ans)
  if cur == nums.length
    ans.push t.dup
    return ans
  end
  t.push nums[cur]
  dfs(cur + 1, nums, t, ans)
  t.pop
  dfs(cur + 1, nums, t, ans)
end

nums = [1, 2, 3]
result = subsets(nums)
puts result