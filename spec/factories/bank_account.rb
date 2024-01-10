FactoryBot.define do
  factory :bank_account do
    bank
    provider
    number { Faker::Bank.account_number(digits: 15) }
  end
end
