module MyEnumerable
  def all?
    each { |list| return false unless yield(list) }
    true
  end

  def any?
    each { |list| return true if yield(list) }
    false
  end

  def filter
    output = []
    each { |list| output.push(list) if yield(list) }
    output
  end
end
