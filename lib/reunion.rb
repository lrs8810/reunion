require './lib/activity'

class Reunion
  attr_reader :activities, :cohort_name

  def initialize(cohort_name)
    @cohort_name = cohort_name
    @activities = []
  end
end
