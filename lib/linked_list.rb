
class LinkedList

  def initialize *payload
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
    raise IndexError if index < 0
    node = @head
    return @head.payload if index == 0
    for i in 0...index
      raise IndexError if node.nil?
      node = node.next_list_item
    end
    return node.payload
  end

  def size
    node = @head
    count = 0
    until node == nil do
      node = node.next_list_item
      count += 1
    end
    return count
  end

  def last
    return @head if @head == nil

    node = @head
    until node.last? do
      node = node.next_list_item
    end
    return node.payload
  end

  def to_s
    return "| |" if @head == nil

    node = @head
    string = ''

    while node do
      if node.last?
        string += node.payload + ' '
      else
        string += node.payload + ', '
      end
      node = node.next_list_item
    end

    return "| #{string}|"
  end

end