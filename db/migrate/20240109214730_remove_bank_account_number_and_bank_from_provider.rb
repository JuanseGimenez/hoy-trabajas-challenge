class RemoveBankAccountNumberAndBankFromProvider < ActiveRecord::Migration[7.1]
  def change
    remove_column :providers, :bank_account_number
    remove_column :providers, :bank_id
  end
end
