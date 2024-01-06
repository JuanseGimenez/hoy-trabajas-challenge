describe Bank do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(50) }
  end
end
