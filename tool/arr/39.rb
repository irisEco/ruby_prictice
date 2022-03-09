# #39. 组合总和
#  给你一个 无重复元素 的整数数组 candidates 和一个目标整数 target ，找出 candidates 中可以使数字和为目标数 target 的 所有 不同组合 ，并以列表形式返回。你可以按 任意顺序 返回这些组合。
#
#  candidates 中的 同一个 数字可以 无限制重复被选取 。如果至少一个数字的被选数量不同，则两种组合是不同的。
#
#  对于给定的输入，保证和为 target 的不同组合数少于 150 个。
#
#  示例 1：
#  输入：candidates = [2,3,6,7], target = 7
#  输出：[[2,2,3],[7]]
#  解释：
#  2 和 3 可以形成一组候选，2 + 2 + 3 = 7 。注意 2 可以使用多次。
#  7 也是一个候选， 7 = 7 。
#  仅有这两种组合。

#  示例 2：
#  输入: candidates = [2,3,5], target = 8
#  输出: [[2,2,2,2],[2,3,3],[3,5]]

#  示例 3：
#  输入: candidates = [2], target = 1
#  输出: []


# 思路:对于求所有解的问题适用 [递归回溯],⚔枝才能提高效率
def combination_sum(candidates, target)
  #排序控制剪枝
  candidates = candidates.sort
  callback(candidates, target, [], [], 0)
end


def callback(candidates, target, data, arr, i)
  # 如果组合成目标值, 则将数组追加到arr中,并且截止本次循环
  if target == 0
    info = Array.new(data)
    arr.push info
    return
  end
  # 包含i值和candidates.length-1值
  for j in i..candidates.length - 1
    # 如果 差值 小于 0 ,则直接  跳出本次循环,进入 第i+1的循环
    if target - candidates[j] < 0
      break
    end
    # 如果差值大于或者等于0,则可以追加到data的尾部
    # 追加到data的尾部
    data.push candidates[j]
    callback(candidates, target - candidates[j], data, arr, j)
    # 留出的空白位,用于回溯
    data.pop
  end
  return arr
end


# ruby其他思路
# def combination_sum(candidates, target)
#   # 声明 trget +  1 个数

#   dp = Array.new(target + 1) { [] }
#   # 将数组从大到小排序
#   candidates.sort!.reverse!
#
#   candidates.each do |x|
#     next unless x <= target  # 先过滤掉大于target的值
#
#     dp[x].push([x]) # 将剩余的数组元素,依次放入以它为下标的数组元素中
#     puts "dp[x] => "+dp[x].to_s+" ,x => "+x.to_s
#     puts '-----------------------'
#     puts "x => "+x.to_s+" ,target-x => "+(target-x).to_s
#     (x..target - x).each do |i|
#       puts '-----------------------'
#       puts "dp[i] => "+dp[i].to_s+",x => "+i.to_s
#       puts '-----------------------'
#       dp[i].each do |c|
#         puts "i => "+i.to_s+",x => "+x.to_s+", c => "+ c.to_s
#         puts "dp[i + x] => "+dp[i + x].to_s+", c + [x] => "+(c + [x]).to_s
#         puts '-----------------------'
#         dp[i + x].push(c + [x])
#       end
#     end
#   end

#   dp[target]
# end


candidates = [2, 3, 6, 7]
target = 7
result = combination_sum(candidates, target)

puts result
