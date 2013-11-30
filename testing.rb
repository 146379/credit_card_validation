require_relative 'credit_card_validation'

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

p CreditCardValidation.luhn(4374374300386157)
p CreditCardValidation.luhn(4374379412851998)