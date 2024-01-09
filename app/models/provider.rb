class Provider < ApplicationRecord
  validates :name, :nit, :contact_name, presence: true
  validates :nit, length: { maximum: 11 }, format: { with: /\A\d{9}-\d?\z/, message: '9 digits - 1 optional digit' }
  validates :contact_phone, length: { maximum: 10 }
end
