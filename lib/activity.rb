class Activity
  attr_reader :name, :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(participant, payment)
    @participants[participant] = payment
  end

  def total_cost
    @participants.values[0]
  end
end
