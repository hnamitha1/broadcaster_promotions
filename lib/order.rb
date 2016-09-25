class Order
    def initialize(material, delivery_discount, price_discount)
        @material = material
        @delivery_discount = delivery_discount
        @price_discount = price_discount
        @items = []
    end
    
    def add(broadcaster, delivery)
        raise ArgumentError unless broadcaster || delivery
        items << [broadcaster, delivery]
    end
    
    def total
        total = total_price - delivery_discount.discount(items, total_price)
        total - price_discount.discount(items, total)
    end
    
    private
    
    attr_accessor :material, :items, :delivery_discount, :price_discount
    
    def total_price
        items.inject(0) { |memo, (_, delivery)| memo += delivery.price }
    end
end