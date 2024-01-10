class CreateBankAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :bank_accounts do |t|
      t.references :provider, null: false, foreign_key: true
      t.references :bank, null: false, foreign_key: true
      t.string :number, limit: 15

      t.timestamps
    end
  end
end
