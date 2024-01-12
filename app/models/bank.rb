class Bank < ApplicationRecord
  self.per_page = 10

  has_many :bank_accounts # rubocop:disable Rails/HasManyOrHasOneDependent

  validates :name, presence: true, length: { maximum: 50 }

  before_destroy :check_for_associated_accounts

  private

  def check_for_associated_accounts
    return unless bank_accounts.any?

    errors.add(:base, I18n.t('bank.validation.bank_account_presence'))
    throw(:abort)
  end
end
