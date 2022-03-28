#253. 会议室 II
# 给你一个会议时间安排的数组 intervals ，每个会议时间都会包括开始和结束的时间 intervals[i] = [starti, endi] ，返回 所需会议室的最小数量 。
#
#
#
# 示例 1：
#
# 输入：intervals = [[0,30],[5,10],[15,20]]
# 输出：2
# 示例 2：
#
# 输入：intervals = [[7,10],[2,4]]
# 输出：1
#
#
# 提示：
#
# 1 <= intervals.length <= 104
# 0 <= starti < endi <= 106
#

# 画一个时间轴,即可发现就是求 最小数组交叉的数量,交叉:说明一个会议室同时被两个会议预定,则最少两个会议室,如果不交叉,则说明在多个不同时间段预定了一个会议室
# 滑动指针技巧
def min_meeting_rooms(intervals)
  return 1 if intervals.length == 1
  # 最小会议室数量
  min_rooms = 0
  time_start = []
  time_end = []
  rooms = 0
  for i in 0...intervals.length
    time_start.push intervals[i][0]
    time_end.push intervals[i][1]
  end
  time_start = time_start.sort
  time_end = time_end.sort
  j = 0
  i = 0
  while i < intervals.length
    # 只检查交叉的数据,当一个会议室的时间完全覆盖另外一个
    if time_start[i] < time_end[j]
      i = i + 1
      min_rooms = min_rooms + 1
    else
      min_rooms = min_rooms - 1
      j = j + 1
    end
    rooms = [rooms, min_rooms].max
  end
  rooms
end

intervals = [[7, 10], [2, 4]]
result = min_meeting_rooms(intervals)

puts result