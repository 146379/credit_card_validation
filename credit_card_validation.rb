module CreditCardValidation

  # TODO; implement logic to handle odd length CC#'s'
  def self.luhn(credit_card_number)
    digits = credit_card_number.to_s.split('').map(&:to_i)
    evens, odds = *digits.each_slice(2).to_a.transpose
    (evens.map { |d| 2*d > 9 ? 1 + 2*d % 10 : 2*d } + odds).reduce(:+)
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
end


# cursory testing
cc = 7821535722532865
p CreditCardValidation.luhn(cc)
p CreditCardValidation.valid_credit_card?(cc)

cc2 = CreditCardValidation.generate_valid_credit_card_number
p cc2
p CreditCardValidation.luhn(cc2)
p CreditCardValidation.valid_credit_card?(cc2)
p CreditCardValidation.visa?(4036465843269999)
p CreditCardValidation.mastercard?(5759095078005073)

