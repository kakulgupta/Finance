#Money takes in values in rupees and paise and adds it after converting it to paise
class Money
  attr_reader :paise
    def initialize(rupees, paise)
      @paise = rupees*100 + paise
    end

    def +(other)
      Money.new(0, (@paise + other.paise))
    end

    def -(other)
      
      Money.new(0, (@paise - other.paise))
    end

    def ==(other)
      return false unless other.class == Money
      self.paise == other.paise
    end

    def eql?(other)
      self.paise == other.paise
    end
    def to_s
      "Rs #{(self.paise / 100) } & #{ ((self.paise % 100))} paise"
    end

    def <=>(other)
      @paise <=> other.paise
    end
end

Money.new(100,99).to_s