describe Provider do
  describe 'validations' do
    it { is_expected.to have_one(:bank_account) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:nit) }
    it { is_expected.to validate_presence_of(:contact_name) }
    it { is_expected.to validate_length_of(:nit).is_at_most(11) }
    it { is_expected.to validate_length_of(:contact_phone).is_at_most(10) }
    it { is_expected.to allow_value('123456789-1').for(:nit) }
    it { is_expected.to allow_value('123456789-').for(:nit) }
    it { is_expected.not_to allow_value('123456789-12').for(:nit) }
    it { is_expected.not_to allow_value('123456789').for(:nit) }
  end
end
