class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status
  @@all = []
  
  def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = "pending"
      @@all << self
  end

  def self.all
      @@all
  end

  def valid?
    @sender.valid?
    @receiver.valid?
  end

  def execute_transaction
    
    if @status == "pending" && @sender.balance >= @amount && @sender.status == "open" && @receiver.status == "open" 
      @sender.balance -= @amount 
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  
  def reverse_transfer
    if @status == "complete" 
      @sender.balance += @amount 
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
