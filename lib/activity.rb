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
    @participants.sum do |key, value|
      value
    end
  end

  def split
    total_cost / @participants.length
  end

  def owed
    @participants.each_value do |value|
      split - value
    end
    require 'pry'; binding.pry
  end
end
