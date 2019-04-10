module Seeds
  class Base
    def self.applicable?
      fail "Override #applicable?"
    end

    def self.apply
      fail 'Not Applicable' unless applicable?

      new.tap(&:apply)
    end
  end
end
