class Order
    def initialize(material, promotional_rule)
        @material = material
        @promotional_rule = promotional_rule
        @items = []
    end
    
    def add(broadcaster, delivery)
        raise ArgumentError unless broadcaster || delivery
        items << [broadcaster, delivery]
    end
    
    private
    
    attr_accessor :material, :items, :promotional_rules
end