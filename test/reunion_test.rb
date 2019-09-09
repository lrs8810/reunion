require 'minitest/autorun'
require 'minitest/pride'
require './lib/reunion'

class ReunionTest < Minitest::Test
  def setup
    @reunion = Reunion.new("1406 BE")

  end

  def test_it_exists
    assert_instance_of Reunion, @reunion
  end

  def test_initialize
    assert_equal [], @reunion.activities
    assert_equal "1406 BE", @reunion.cohort_name
  end

  def test_activity_can_be_added_to_reunion
    activity_1 = Activity.new("Brunch")
    @reunion.add_activity(activity_1)

    assert_equal [activity_1], @reunion.activities
  end
end
