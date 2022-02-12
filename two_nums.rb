def two_sum(nums, target)
  map = {}

  nums.each_with_index do |e, i|
    return [map[e], i] if map.has_key?(e)
    map[target - e] = i
  end
end

#---------------------------------------------

#two_sum([2,5,5,11],10)


def two_sum(nums, target)
  map = {}
  nums.each_with_index {|x, j| map[target - x] = j}
  nums.each_with_index {|s, y| return [y, map[s]] if map[s] and y != map[s]}

end


#----------------------------------------------
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  hashtable = {}
  nums.each_with_index do |num, index|
    # p "#{index}:#{num}"
    if hashtable.key?(target - num)
      return hashtable[target - num], index
    end
    hashtable[nums[index]] = index
  end
  []
end

#--------------------------------------------------

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  x, y = nil, nil
  nums.each_with_index do |n1, i1|
    n2 = target - n1
    i2 = nums[i1+1..-1].index(n2)
    if i2
      x, y = i1, i2+i1+1
      break
    end
  end
  [x, y]
end


#-----------------------------------------
def two_sum(nums, target)
  nums.each_with_index.inject([{},0]) {|t,(e,i)|t[1]=[t[0][target-e],i] if t[0].include?(target-e);t[0][e]=i;t}[1]
end

