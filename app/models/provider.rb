class Provider < ApplicationRecord
  has_one :bank_account, dependent: :destroy

  accepts_nested_attributes_for :bank_account

  validates :name, :nit, :contact_name, presence: true
  validates :nit, length: { maximum: 11 }, format: { with: /\A\d{9}-\d?\z/, message: I18n.t('provider.nit_format') }
  validates :contact_phone, length: { maximum: 10 }
end
