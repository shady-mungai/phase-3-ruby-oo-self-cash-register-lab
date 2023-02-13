class CashRegister
    attr_accessor :discount, :total, :items

    def initialize(discount = nil)
        @total = 0
        @discount = discount
        @items = []

    end

    def add_item(title, price, quantity = 1)
        @last_transaction = [title, price, quantity]
        quantity.times{@items << title}
        @total = @total + price * quantity
    end

    def apply_discount
        if @discount.nil? == true
            "There is no discount to apply."
        else
            discount = @discount/100.0 * self.total
            @total = @total - discount
            "After the discount, the total comes to $#{@total.round}."
        end     
    end

    def void_last_transaction
        @total = @total - (@last_transaction[1] * @last_transaction[2])
    end
end