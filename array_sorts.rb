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



end
