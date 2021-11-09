require 'pry'
class CashRegister
    attr_accessor :total, :discount, :last_item

    @@all = []

    def initialize(input = 0)
        @total = 0
        @discount = input
    end

    def add_item title, price, quantity = 1
        self.total += price * quantity
        quantity.times {@@all << title}
        @last_item = price * quantity
    end

    def apply_discount
        self.clear_cart
        if discount != 0
            @total = @total.to_f * (1.0 - @discount.to_f / 100.0)
            "After the discount, the total comes to $#{@total.to_i}."
        else
            'There is no discount to apply.'
        end
    end

    def items
        @@all
    end

    def void_last_transaction
        if @total > 0
            @total -= @last_item
        else
            nil
        end
        @total.to_f
        # if @total = 0
        #     0.0
        # else
        #     nil
        # end
    end

    def clear_cart
        @@all = []
    end
end