require 'date'

class InterestCalculator

  attr_reader :rate, :principal, :term

  def initialize(term:, principal:, rate:)
    @term = term
    @principal = principal
    @rate = rate
  end
  
  def num_days(from_date: Date.today)
    today = from_date
    return 0 if from_date.day == 1
    (next_month(from_date: from_date) - from_date).to_i
  end
  
  def prepaid_interest
    daily_rate * principal * num_days
  end

  def next_month(from_date: Date.today)
    Date.new(from_date.next_month.year, from_date.next_month.month, 1)
  end

  def daily_rate
    rate/100.0/365.0
  end
end
