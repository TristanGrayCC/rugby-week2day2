class Bus

  attr_accessor :number

  def initialize(number, destination)
    @number = number
    @destination = destination
    @passengers = []
  end

  def drive
    return "Brum brum"
  end

  def number_of_passengers
    return @passengers.length
  end

  def pick_up(person)
    @passengers << person
  end

  def drop_off(person)
    @passengers.delete(person)
  end

  def empty
    @passengers = []
  end

  def pick_up_from_stop(stop)
    for passenger in stop.queue
      @passengers << passenger
      # stop.queue.delete(passenger)
    end
    stop.queue.clear()
  end

end
