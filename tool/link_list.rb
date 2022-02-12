require File.expand_path("list_node.rb", File.dirname(__FILE__))
module Tool
class LinkedList
  attr_accessor :tail, :head

  def initialize
    @head = nil
    @tail = nil
  end


  def add_last (data)
    node = Tool::ListNode.new(data)
    if !@head
      @head = node
      @tail = node
      return
    end
    last_node = get_last()
    last_node.next = node
    @tail = node
  end

  def add_first (data)
    @head = ListNode.new(data, @head)
  end

  def get_last
    return if !@head
    node = @head
    until node.next.nil?
      node = node.next
    end
    return node
  end

  def add_at (index, data)
    if !@head
      @head = ListNode.new(data)
      return
    end
    if index == 0
      add_first(data)
      return
    end

    previous = get_node(index — 1) || get_last()
    node = ListNode.new(data, previous.next)
    previous.next = node
  end

  private

  def get_node (index)
    return if !@head
    return @head if index === 0

    node = @head
    counter = 0
    until node.next.nil?
      node = node.next
      counter += 1
      return node if counter === index
    end
  end

end
end