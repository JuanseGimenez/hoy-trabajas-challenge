class BankAccount < ApplicationRecord
  belongs_to :provider
  belongs_to :bank

  validates :number, length: { maximum: 15 }
end
