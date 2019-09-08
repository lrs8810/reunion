require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def setup
    @activity = Activity.new("Brunch")
  end

  def test_it_exits
    assert_instance_of Activity, @activity
  end

  def test_initialize
    assert_equal "Brunch", @activity.name
    assert_empty @activity.participants
  end

  def test_one_participant_can_join_activity
    @activity.add_participant("Maria", 20)
    expected = {"Maria" => 20}

    assert_equal expected, @activity.participants
  end

  def test_activity_total_cost
    @activity.add_participant("Maria", 20)

    assert_equal 20, @activity.total_cost

    @activity.add_participant("Luther", 40)

    assert_equal 60, @activity.total_cost
  end

  def test_multiple_participants_can_join_activity
    @activity.add_participant("Maria", 20)
    @activity.add_participant("Luther", 40)
    expected = {"Maria" => 20, "Luther" => 40}

    assert_equal expected, @activity.participants
  end

  def test_cost_can_be_split
    @activity.add_participant("Maria", 20)
    @activity.add_participant("Luther", 40)

    assert_equal 30, @activity.split
  end

  def test_participants_can_owe_money
    @activity.add_participant("Maria", 20)
    @activity.add_participant("Luther", 40)
    expected = {"Maria" => 10, "Luther" => -10}

    assert_equal expected, @activity.owed
  end
end
