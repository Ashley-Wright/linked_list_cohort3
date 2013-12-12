
class LinkedListItem
  include Comparable

  def initialize item
    @item = item
    @next_list_item = nil
  end

  def payload
    @item
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
    self.payload.to_s <=> other.payload.to_s
  end

  def === (other)
    self.object_id == other.object_id
  end

end