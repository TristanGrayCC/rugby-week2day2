class BusStop

attr_accessor :name, :queue

  def initialize(name)
    @name = name
    @queue = []
  end

  def add_to_queue(person)
    @queue << person
  end

end
