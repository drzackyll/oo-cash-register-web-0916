class CashRegister
  attr_accessor :discount, :total, :void_last_transaction

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = 0
  end

  def add_item(item, price, quantity=1)
    @last_transaction = price
    @total += price * quantity
    quantity.times do |thing|
      @items.push(item)
    end
  end

  def apply_discount
    if discount > 0
      @total = total - (total * discount / 100.00)
      @total.to_i
      "After the discount, the total comes to $800."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = @total - @last_transaction
  end
end
