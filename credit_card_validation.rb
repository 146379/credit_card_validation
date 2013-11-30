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
    digits = Array.new(15) { rand(10) }
    sum = digits.map.with_index do |digit, i|
      i.odd? ? digit : 2 * digit / 10 + 2 * digit % 10
    end.reduce(:+)
    checksum = ((10 - sum) % 10) % 10
    digits.map(&:to_s).join + checksum.to_s
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