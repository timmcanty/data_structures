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
    node.parent = self
  end

  def right=(node)
    @right = node
    node.parent = self
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
      right ? right.search : false
    when 0
      self
    when -1
      left ? left.search : false
    end
  end

  def next
  end

end
