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
end
