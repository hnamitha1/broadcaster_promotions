class Order
    COLUMNS = {
        broadcaster: 20,
        delivery: 8,
        price: 8
    }.freeze
    
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
    
    def output
        [].tap do |result|
            result << "Order for #{material.identifier}:"
    
            result << COLUMNS.map { |name, width| name.to_s.ljust(width) }.join(' | ')
            result << output_separator
    
            items.each_with_index do |(broadcaster, delivery), index|
                result << [
                    broadcaster.name.ljust(COLUMNS[:broadcaster]),
                    delivery.name.to_s.ljust(COLUMNS[:delivery]),
                    ("$#{delivery.price}").ljust(COLUMNS[:price])
                ].join(' | ')
            end
    
            result << output_separator
            result << "Total: $#{total
            }"
        end.join("\n")
    end
    
    private
    
    attr_accessor :material, :items, :delivery_discount, :price_discount
    
    def total_price
        items.inject(0) { |memo, (_, delivery)| memo += delivery.price }
    end
    
    def output_separator
        @output_separator ||= COLUMNS.map { |_, width| '-' * width }.join(' | ')
    end
end