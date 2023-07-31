require_relative 'enumerable_module'

class List
  include MyEnumerable

  attr_reader :list

  def initialize(*lists)
    @list = lists
  end

  def each(&block)
    @list.each(&block)
  end
end

list = List.new(1, 2, 3, 4, 5)

puts(list.all? { |x| x < 6 })
# true
puts(list.all? { |e| e > 5 })
# false
puts(list.any? { |e| e == 2 })
# true
puts(list.any? { |e| e == 6 })
# false
print(list.filter(&:even?))
# [2, 4]
