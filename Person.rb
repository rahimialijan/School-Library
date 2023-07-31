class Person
  attr_reader :id, :name, :age
  def initialize(name="Unknown", age=0, parent_permission=true)
    @id = random_id
    @name= name
    @age=age
    @parent_permission=parent_permission
  end

  def random_id
    Random.rand(1..1000)
  end


  def name= (name)
    @name=name
  end

  def age=(age)
    @age=age
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  Private
  def of_age
    @age >=18
  end

end