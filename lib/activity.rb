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
    @participants.values.sum
  end

  def split
    total_cost / @participants.length
  end

  def owed
    @participants.inject(Hash.new(0)) do |new_hash, (key, value)|
      new_hash[key] = split - value
      new_hash
    end
  end
end
