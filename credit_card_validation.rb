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


end


# cursory testing
p CreditCardValidation.luhn(5730165506115283)
p CreditCardValidation.valid_credit_card?(5730165506115283)