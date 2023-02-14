class AtmDispenser
  attr_accessor :amount, :denominations
  AVAILABLE_DENOMINATIONS = [2000, 500, 200, 100]

  def initialize(amount)
    @amount = amount
    @denominations = {}
  end

  def process
    return "Enter the amount in the denominations of #{AVAILABLE_DENOMINATIONS.join(", ")}" unless valid_amount?

    AVAILABLE_DENOMINATIONS.each do |denom|
      break if @amount == 0
      next if @amount / denom == 0
  
      denominations[denom] = @amount / denom 
      @amount = @amount - (denom * denominations[denom])
    end
    denominations
  end
  
  private
  
  def valid_amount?
    amount % 100 == 0
  end
end