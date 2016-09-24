class PriceDiscount
    def initialize(threshold, discount_percentage)
        @threshold = threshold.to_f
        @discount_percentage = discount_percentage.to_f
    end
    
    def discount(_, total)
        if total.to_f > threshold
            discount_amount(total.to_f).round 2
        else
            0
        end
    end
    
    private
    
    attr_accessor :threshold, :discount_percentage
    
    def discount_amount(total)
        total * (discount_percentage / 100)
    end
end