module CreditCardValidation
  def luhn(credit_card_number)
    digits = credit_card_number.to_s.split('').map(&:to_i)
    evens, odds = *digits.each_slice(2).to_a.transpose
    (evens.map { |d| 2*d > 9 ? 1 + 2*d % 10 : 2*d } + odds).reduce(:+)
  end
end