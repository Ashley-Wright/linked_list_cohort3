
class LinkedList

  def initialize
    @head = nil
  end

  def add_item payload
    if @head == nil
      @head = LinkedListItem.new(payload)
      node = @head
    else
      node = @head
      while node.next_list_item != nil do
        node = node.next_list_item
      end
      node.next_list_item = LinkedListItem.new(payload)
    end
  end

  def get index
    if index < 0
      raise IndexError
    end
    node = @head
    return @head.payload if index == 0
    for i in 0...index
      node = node.next_list_item
    end
    return node.payload
  end

end