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

  def self.discover?(cc_no)
    self.valid_credit_card?(cc_no) && cc_no.to_s[0, 4] == '6011'
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

bin = [503957, 473055, 403646, 469011, 437437, 
       536232, 443010, 552698, 424467, 573811, 
       540878, 409181, 502510, 473258, 455962,
       425193, 597755, 506135, 466106, 501835, 
       413449, 591770, 418444, 595373, 585778, 
       587354, 454715, 591172, 575909, 588253, 
       515279, 574215, 479346, 538323, 437593, 
       587307, 592943, 580761, 464006, 462270, 
       575172, 564734, 411721, 589269, 501114, 
       568820, 426624, 454203, 529214, 444561, 
       551683, 561533, 575308, 546291, 571928, 
       495555, 491804, 469952, 562562, 505620, 
       461093, 520470, 502413, 458638, 468479, 
       454822, 573016, 526554, 553830, 431120, 
       567539, 549818, 589538]

psum = bin.map do |cc|
  CreditCardValidation.luhn(cc)
end

p psum, psum.length, psum.uniq, psum.uniq.length

