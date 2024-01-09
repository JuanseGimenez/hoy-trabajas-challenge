class AddBankAndBankAccountNumberToProvider < ActiveRecord::Migration[7.1]
  def change
    add_reference :providers, :bank, null: false, foreign_key: true
    add_column :providers, :bank_account_number, :string, limit: 10
  end
end
