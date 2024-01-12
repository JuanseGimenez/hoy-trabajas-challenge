json.extract! provider, :id, :name, :nit, :contact_name, :contact_phone, :created_at, :updated_at
json.bank provider.bank_account.bank.name
json.bank_account_number provider.bank_account.number
json.url provider_url(provider, format: :json)
