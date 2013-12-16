
class LinkedListItem
  include Comparable

  def initialize item
    @item = item
    @next_list_item = nil
  end

  def payload
    @item
  end

  def payload= item
    @item = item
  end

  #---- Next List Item ----#

  def next_list_item= next_item
    if next_item === self
      raise ArgumentError, "Next list item cannot equal self"
    else
      @next_list_item = next_item
    end
  end

  attr_reader :next_list_item

  def last?
    @next_list_item.nil?
  end

  #---- Comparables----#

  def <=> (other)
    return 1 if self.payload.is_a?(Symbol) && !other.payload.is_a?(Symbol)
    return -1 if !self.payload.is_a?(Symbol) && other.payload.is_a?(Symbol)

    return -1 if self.payload.is_a?(Fixnum) && !other.payload.is_a?(Fixnum)
    return 1 if !self.payload.is_a?(Fixnum) && other.payload.is_a?(Fixnum)

    if self.payload.class == other.payload.class
      self.payload <=> other.payload
    end
  end

  def === (other)
    self.object_id == other.object_id
  end

end