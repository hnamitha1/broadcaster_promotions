class DeliveryDiscount
    def initialize(name, new_price, quantity_threshold)
        @name = name
        @new_price = new_price
        @quantity_threshold = quantity_threshold
    end
    
    def discount(deliveries, _)
        return 0 unless deliveries
        @deliveries = deliveries
        discount_amount.round 2
    end
    
    private
    
    attr_accessor :name, :new_price, :quantity_threshold, :deliveries
    
    def products
        deliveries.reject { |(_, delivery)| delivery.name != name }
    end

    def discount_amount
        if products.count >= quantity_threshold
           new_price
        else
            0
        end
    end
end