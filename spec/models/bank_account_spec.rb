describe BankAccount do
  describe 'validations' do
    it { is_expected.to belong_to(:bank) }
    it { is_expected.to belong_to(:provider) }
    it { is_expected.to validate_length_of(:number).is_at_most(15) }
  end
end
