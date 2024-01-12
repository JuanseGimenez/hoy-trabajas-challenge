FactoryBot.define do
  factory :provider do
    name { Faker::Company.name }
    nit { '901362343-4' }
    contact_name { Faker::Name.name }
    contact_phone { '123456789' }

    before(:create) do |provider|
      provider.bank_account = create(:bank_account, provider:)
    end
  end
end
