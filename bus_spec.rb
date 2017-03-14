require ('minitest/autorun')
require ('minitest/rg')
require ('./bus')
require ('./person')
require ('./bus_stop')

class TestBus < MiniTest::Test

  def setup
    @bus22 = Bus.new(22, "Maidenhead")
    @Roz = Person.new("Rory Sutherland", 27)
    @Richard = Person.new("Richard Nibb", 25)
    @Dave = Person.new("David Malcolm", 13)
    @Rob = Person.new("Rob Barnett", 43)
    @maidenstone = BusStop.new("Maidenstone")
  end

  def test_drive
    assert_equal(@bus22.drive, "Brum brum")
  end

  def test_number_of_passengers
    result = @bus22.number_of_passengers
    assert_equal(0, result)
  end

  def test_pick_up
    @bus22.pick_up(@Roz)
    result = @bus22.number_of_passengers
    assert_equal(1, result)
  end

  def test_drop_off
    @bus22.pick_up(@Roz)
    @bus22.pick_up(@Dave)
    @bus22.drop_off(@Roz)
    result = @bus22.number_of_passengers
    assert_equal(1, result)
  end

  def test_empty
    @bus22.pick_up(@Roz)
    @bus22.pick_up(@Rob)
    @bus22.pick_up(@Richard)
    @bus22.pick_up(@Dave)
    @bus22.empty
    result = @bus22.number_of_passengers
    assert_equal(0, result)
  end

  def test_add_to_queue
    @maidenstone.add_to_queue(@Roz)
    result = @maidenstone.queue.length
    assert_equal(1, result)
  end

  def test_pick_up_from_stop
    @maidenstone.add_to_queue(@Roz)
    @maidenstone.add_to_queue(@Rob)
    @bus22.pick_up_from_stop(@maidenstone)
    result1 = @bus22.number_of_passengers
    result2 = @maidenstone.queue
    # puts result1
    # puts result2
    assert_equal(2, result1)
    assert_equal([], result2)
  end

end
