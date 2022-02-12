# Definition for singly-linked list.
# 02 两数相加
# 链接：https://leetcode-cn.com/problems/add-two-numbers
# 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
# 解题思路
# 重点在于递归与链表的使用
# 一.递归
# 递归的要点在于调用自身,但是没有条件中止调用,就会陷入死循环,这是其一;
# 其二,递归是如何计算完当前数据并且如何拿到下一个数据的呢?参数,通过参数传递
# 所以,整个流程就是,
# 1.将某个数据结构作为入参并加上结果数据的入参,
# 2.设置递归中止条件,在不满足条件内对数据做计算,计算完传递给自身,
# 3.当整个数据结构递归完,即,满足递归条件时,则对结果数据做处理,并返回
# 二.链表
#
# require 'tool/link_list.rb'
puts File.dirname(__FILE__)
puts File.expand_path("tool/link_list.rb", File.dirname(__FILE__))
require File.expand_path("tool/link_list.rb", File.dirname(__FILE__))
def add_two_numbers(l1, l2, values_l1=[],values_l2=[])
  if !l1.nil? || !l2.nil?
    values_l1<<l1&.val
    values_l2<<l2&.val
    add_two_numbers(l1&.next,l2&.next,values_l1,values_l2)
  else
    val_1 = values_l1.reverse.join.to_i
    val_2 = values_l2.reverse.join.to_i
    arg =  val_1+val_2
    result = arg.to_s.split('').reverse.map do |i| i.to_i end
    return result
  end
end


l1 = Tool::LinkedList.new
l2 = Tool::LinkedList.new
arg1 = [9,9,9,9,9,9,9]
arg2 = [9,9,9,9]
arg1.each do |i|
  l1.add_last(i)
end
arg2.each do |i|
  l2.add_last(i)
end
puts l1.head.val
result = add_two_numbers(l1.head, l2.head,[],[])
puts result