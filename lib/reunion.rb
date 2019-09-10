require './lib/activity'

class Reunion
  attr_reader :activities, :cohort_name

  def initialize(cohort_name)
    @cohort_name = cohort_name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    @activities.sum(&:total_cost)
  end

  def breakout
    owed_each_activity = @activities.map(&:owed)
    totals = owed_each_activity.reduce({}) do |name, owed|
      owed.merge(name) {|new_hash, value_a, value_b| value_a + value_b}
    end
    totals
  end
end
