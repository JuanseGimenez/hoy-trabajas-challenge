puts 'Creating banks...'
banks = ['ICBC', 'Banco Nacion', 'Banco Provincia']

banks.each do |name|
  bank = Bank.create!(name: name)
  puts "Bank created #{bank.name}"
end

puts 'Creating providers...'
30.times do
  provider = Provider.create!(name: Faker::Company.name,
                             nit: "#{Faker::Number.number(digits: 9)}-#{Faker::Number.number(digits: 1)}",
                             contact_name: Faker::Name.name,
                             contact_phone: Faker::Number.number(digits: 10))
  puts "Provider created #{provider.name}"

  puts 'Creating bank account...'
  bank_account = BankAccount.create!(number: Faker::Number.number(digits: 15),
                     bank_id: Bank.all.sample.id,
                     provider_id: provider.id)
  puts "Bank account created #{bank_account.number}"
end

puts 'Creating user...'
user = User.create!(email: 'admin@challenge.com',
                    password: 'password',
                    password_confirmation: 'password')
puts "User created email: #{user.email} password: password"
