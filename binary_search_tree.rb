class BinarySearchTreeNode

  attr_accessor :node, :parent, :value
  attr_reader :left, :right

  def initialize(value, options={})
      @left = options[:left]
      @right = options[:right]
      @parent = options[:parent]
      @value = value
      @left.parent = self if @left
      @right.parent = self if @right
  end

  def left=(node)
    @left = node
    node.parent = self if node
  end

  def right=(node)
    @right = node
    node.parent = self if node
  end

  def min
    node = self
    node = node.left while node.left
    node
  end

  def max
    node = self
    node = node.right while node.right
    node
  end

  def search(value)
    case @value <=> value
    when -1
      right ? right.search(value) : false
    when 0
      self
    when 1
      left ? left.search(value) : false
    end
  end

  def next
    if self.right
      node = self.right
      node = node.left while node.left
      return node
    end

    node = self
    while true
      parent_node = node.parent
      return nil unless parent_node
      return parent_node if parent_node.left == node
      node = parent_node
    end
  end

  def size
    left && left_weight = left.size
    right && right_weight = right.size
    left_weight ||= 0
    right_weight ||= 0

    left_weight + right_weight + 1
  end

  def is_balanced?
    subs = [left, right]
    return true if subs == [nil,nil]
    if subs[0].nil?
      subs[1].size == 1 && subs[1].is_balanced?
    elsif subs[1].nil?
      subs[0].size == 1 && subs[0].is_balanced?
    else
      subs.all? { |sub| sub.is_balanced? } && (subs[0].size - subs[1].size).abs <= 1
    end
  end

  def insert(val)
    raise 'Error: BST cannot have dups!' if val == value
    if val < value
      if left
        return left.insert(val)
      else
        self.left = BinarySearchTreeNode.new(val)
        return self.left
      end
    else
      if right
        return right.insert(val)
      else
        self.right = BinarySearchTreeNode.new(val)
        return self.right
      end
    end
  end

  def delete(val)
    removed_node = self.search(val)
    return nil unless removed_node

    if (!removed_node.left && !removed_node.right)
      removed_node.parent.left == removed_node ? removed_node.parent.left = nil : removed_node.parent.right = nil
      removed_node.parent = nil
      removed_node
    elsif (!removed_node.left)
      removed_node.parent.left == removed_node ? removed_node.parent.left = removed_node.right : removed_node.parent.right = removed_node.right
      removed_node.right = nil
      removed_node.parent = nil
      removed_node
    elsif (!removed_node.right)
      removed_node.parent.left == removed_node ? removed_node.parent.left = removed_node.left : removed_node.parent.right = removed_node.left
      removed_node.left = nil
      removed_node.parent = nil
      removed_node
    else
      removed_node.left.max.right = removed_node.right
      removed_node.parent.left == removed_node ? removed_node.parent.left = removed_node.left : removed_node.parent.right = removed_node.left
      removed_node.left = nil
      removed_node.right = nil
      removed_node.parent = nil
      removed_node
    end
  end

end
