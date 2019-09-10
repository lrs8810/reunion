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

  def owed_each_activity
    @activities.map(&:owed)
  end

  def breakout
    owed_each_activity.inject(Hash.new(0)) do |breakout, activity_participants|
      activity_participants.each do |name, owed|
        breakout[name] += owed
      end
      breakout
    end
  end

  def summary
    breakout.inject("") do |result, (name, owed)|
      result + "#{name}: #{owed}\n"
    end
  end
end
