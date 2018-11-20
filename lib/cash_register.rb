require 'pry'
class CashRegister
  def initialize(discount=nil)
    @total=0
    @discount=discount
    @items=[]
    @last_item={}
  end
  def total
    @total
  end
  def total=(total)
    @total=total
  end
  def discount
    @discount
  end
  def add_item(name, price, quantity=1)
    @total+=price*quantity
    for i in 1..quantity
      @items.push(name)
    end
    @last_item={name: name, price: price, quantity: quantity}
  end
  def apply_discount
    if @discount!=nil
      @total=(@total-@total*@discount/100.00).to_i
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end
  def items
    @items
  end
  def void_last_transaction
    @total-=@last_item[:price]*@last_item[:quantity]
    for i in 1..@last_item[:quantity]
      @items.delete_at(@items.index(@last_item[:name]))
    end
  end
end
