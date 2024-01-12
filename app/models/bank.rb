class Bank < ApplicationRecord
  self.per_page = 10

  validates :name, presence: true, length: { maximum: 50 }
end
