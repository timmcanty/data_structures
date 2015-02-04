class Array

  def selection_sort!
    size.times do |i|
      min = self[i..-1].min
      min_idx = self.find_index(min)
      self[i], self[min_idx] = self[min_idx], self[i]
    end
    self
  end

  def selection_sort
    arr = self.dup
    arr.selection_sort!
  end

  def insertion_sort
    arr = self
    size.times do |i|
      (0...i).each do |j|
        if arr[i] < arr[j]
          arr = (arr[0...j] + [arr[i]] + arr[j+1...i] + [arr[j]] + arr[(i+1)..-1])
        end
      end
    end

    arr
  end

  def shell_sort(dec_seq)
    dec_seq.each do |h|
    end
  end

  def merge_sort
    return self if self.size <= 1

    midpoint = self.size / 2
    left = self[0...midpoint].merge_sort
    right = self[midpoint..-1].merge_sort

    Array.merge(left,right)
  end

  private

  def self.merge(arr1,arr2)
    container = []

    until arr1.empty? || arr2.empty?
      if arr1[0] <= arr2[0]
        container << arr1.shift
      else
        container << arr2.shift
      end
    end

    container + arr1 + arr2
  end






end
