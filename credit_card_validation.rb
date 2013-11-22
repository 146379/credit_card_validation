module CreditCardValidation
  def luhn(credit_card_number)
    digits = credit_card_number.to_s.split('')
    evens = digits.select.with_index { |d, i| d if i.even? }
    odds = digits.select.with_index { |d, i| d if i.odd? }
    evens.map!(&:to_i).map! { |d| 2*d }
    evens.map! { |d| d > 9 ? 1 + d % 10 : d }
    evens.reverse!
    odds.map!(&:to_i)
    odds.reverse!
    (evens + odds).reduce(:+)
  end
end