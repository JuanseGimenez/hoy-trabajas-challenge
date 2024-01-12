class Provider < ApplicationRecord
  self.per_page = 10

  has_one :bank_account, dependent: :destroy
  has_one :bank, through: :bank_account

  accepts_nested_attributes_for :bank_account

  validates :name, :nit, :contact_name, presence: true
  validates :nit, length: { maximum: 11 }, format: { with: /\A\d{9}-\d?\z/, message: I18n.t('provider.nit_format') }
  validates :contact_phone, length: { maximum: 10 }
  validates :bank_account, presence: { message: I18n.t('provider.bank_account_presence') }
end
