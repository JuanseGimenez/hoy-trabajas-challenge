describe BanksController do
  let!(:bank) { create(:bank) }
  let(:default_headers) { { 'Accept' => 'application/json' } }

  describe 'GET #index' do
    it 'returns a success response' do
      get banks_path, headers: default_headers
      expect(response).to have_http_status(:ok)
    end

    it 'returns a list of banks' do
      get banks_path, headers: default_headers
      expect(response.body).to include(bank.name)
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get bank_path(bank), headers: default_headers
      expect(response).to have_http_status(:ok)
    end

    it 'returns the bank' do
      get bank_path(bank), headers: default_headers
      expect(response.body).to include(bank.name)
    end
  end

  describe 'POST #create' do
    let(:bank_params) { { name: 'Bank of America' } }

    it 'returns a success response' do
      post banks_path, params: { bank: bank_params }, headers: default_headers
      expect(response).to have_http_status(:created)
    end

    it 'creates a bank' do
      expect do
        post banks_path, params: { bank: bank_params }, headers: default_headers
      end.to change(Bank, :count).by(1)
    end

    it 'returns the bank' do
      post banks_path, params: { bank: bank_params }, headers: default_headers
      expect(response.body).to include(bank_params[:name])
    end
  end

  describe 'PUT #update' do
    let(:bank_params) { { name: 'Bank of America' } }

    it 'returns a success response' do
      put bank_path(bank), params: { bank: bank_params }, headers: default_headers
      expect(response).to have_http_status(:ok)
    end

    it 'updates the bank' do
      put bank_path(bank), params: { bank: bank_params }, headers: default_headers
      expect(bank.reload.name).to eq(bank_params[:name])
    end

    it 'returns the bank' do
      put bank_path(bank), params: { bank: bank_params }, headers: default_headers
      expect(response.body).to include(bank_params[:name])
    end
  end

  describe 'DELETE #destroy' do
    it 'returns a success response' do
      delete bank_path(bank), headers: default_headers
      expect(response).to have_http_status(:no_content)
    end

    it 'destroys the bank' do
      expect do
        delete bank_path(bank), headers: default_headers
      end.to change(Bank, :count).by(-1)
    end
  end
end
