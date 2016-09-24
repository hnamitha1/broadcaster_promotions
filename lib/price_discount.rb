class PriceDiscount
    def initialize(threshold, discount_percentage)
        @threshold = threshold.to_f
        @discount_percentage = discount_percentage.to_f
    end
    
    private
    
    attr_accessor :threshold, :discount_percentage
end