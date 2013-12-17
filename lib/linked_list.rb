
class LinkedList

  def initialize *payload
    @head = nil
    if payload.length != 0
      payload.each {|item| self.add_item(item)}
    end
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

  def find_node index
    raise IndexError if index < 0
    @node = @head
    return @head.payload if index == 0
    for i in 0...index
      raise IndexError if @node.nil?
      @node = @node.next_list_item
    end
    return @node
  end

  def get index
    self.find_node(index)
    return @node.payload
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
        string += node.payload.to_s + ' '
        return "| #{string}|"
      else
        string += node.payload.to_s + ', '
        node = node.next_list_item
      end
    end
  end

  def [] index
    self.get(index)
  end

  def []= index, payload
    self.find_node(index)
    @node.payload = payload
    return @node.payload
  end

  def remove index
    if index == 0
      @head = @head.next_list_item
      return
    end
    if self.find_node(index) == nil
      raise IndexError
    else
      prev_node = self.find_node(index - 1)
      next_node = self.find_node(index + 1)
      prev_node.next_list_item = next_node
    end
  end

  def indexOf payload
    return nil if @head == nil

    node = @head
    count = 0
    until node.payload == payload do
      if node.next_list_item == nil
        return nil
      end

      node = node.next_list_item
      count += 1
    end

    return count
  end

  def sorted?
    return true if @head == nil

    node = @head
    until node.last? do
      return false if node > node.next_list_item
      node = node.next_list_item
    end
    return true
  end

  def sort
    return self if self.size < 2

    until self.sorted?
      node = @head
      index = 0
      until node.last? do
        if node > node.next_list_item
          a = node
          b = node.next_list_item

          if a == @head && b.last?
            @head = b
            b.next_list_item = a
            a.next_list_item = nil

          elsif a == @head && !b.last?
            self.find_node(index + 2)
            pick_up = @node
            @head = b
            a.next_list_item = pick_up

          elsif a != @head && b.last?
            self.find_node(index - 1)
            left_off = @node
            left_off.next_list_item = b
            a.next_list_item = nil

          elsif a != @head && !b.last?
            self.find_node(index - 1)
            left_off = @node
            self.find_node(index + 2)
            pick_up = @node
            left_off.next_list_item = b
            a.next_list_item = pick_up
          end
          b.next_list_item = a
          node = b
        end
        node = node.next_list_item
        index += 1
      end
    end
    return self
  end

end