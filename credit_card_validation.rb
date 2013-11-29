module CreditCardValidation

  def self.luhn(credit_card_number)
    digits = credit_card_number.to_s.reverse.split('').map(&:to_i)
    digits.map.with_index do |digit, i|
      i.even? ? digit : 2 * digit / 10 + 2 * digit % 10
    end.reduce(:+)
  end

  def self.valid_credit_card?(cc_no)
    # Determines whether a CC# is valid via Luhn algorithm
    luhn(cc_no) % 10 == 0
  end

  def self.generate_valid_credit_card_number
    # Generates a valid 16-digit CC#
    evens, odds = [rand(9)], []
    7.times do
      evens << rand(9)
      odds << rand(9)
    end
    double_evens = evens.map do |digit|
      (2 * digit).to_s.split('').map(&:to_i).reduce(:+)
    end
    checksum = 10 - (double_evens + odds).reduce(:+) % 10
    evens.zip(odds).flatten.join + checksum.to_s[-1]
  end

  def self.visa?(cc_no)
    self.valid_credit_card?(cc_no) && cc_no.to_s[0] == '4'
  end

  def self.mastercard?(cc_no)
    self.valid_credit_card?(cc_no) && cc_no.to_s[0] == '5'
  end

  def self.discover?(cc_no)
    self.valid_credit_card?(cc_no) && cc_no.to_s[0, 4] == '6011'
  end
end