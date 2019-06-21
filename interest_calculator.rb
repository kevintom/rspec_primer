require 'date'

class InterestCalculator

  def initialize(term:, principal:, rate:)
    @term = term
    @principal = principal
    @rate = rate
  end
  
  def num_days
    today = Date.today
    return 0 if today.day == 1
    next_month = Date.new(today.next_month.year, today.next_month.month, 1)
    (next_month - today).to_i
  end
  
  def prepaid_interest
    @rate/100/365.0 * @principal * num_days
  end
end
