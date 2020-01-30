require 'pry' 

class CashRegister
    attr_accessor :employee_discount, :total, :price

    #@@all = []

    def initialize(employee_discount = 0)
        @total = 0
        @employee_discount = employee_discount
        @item_list = []
        @price_list = []
        #@@all.push(self)
    end

    def discount 
        @employee_discount
    end

    def add_item(name, price, quantity = 1)
        @item_list.fill(name, @item_list.size, quantity)
        @price_list << price * quantity
        @total += price * quantity

    end

    def apply_discount
        if @employee_discount != 0
            discounted_to_decimal = @employee_discount.to_f / 100
            discount_amount = @total * discounted_to_decimal
            @total -= discount_amount
            return "After the discount, the total comes to $#{@total.to_int}."
        end
        return "There is no discount to apply."
    end

    #def self.all 
     #   @@all
    #end

    def items
        @item_list
    end 

    def void_last_transaction
        @total -= @price_list.last
    end
end

#binding.pry