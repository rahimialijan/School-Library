require_relative 'person'

class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(name = 'Unknown', age = 0, parent_permission: true)
    super()
    @id = random_id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def random_id
    Random.rand(1..1000)
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
