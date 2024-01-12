describe ProvidersController do
  let!(:provider) { create(:provider) }
  let(:default_headers) { { 'Accept' => 'application/json' } }

  describe 'GET #index' do
    it 'returns a success response' do
      get providers_path, headers: default_headers
      expect(response).to have_http_status(:ok)
    end

    it 'returns a list of providers' do
      get providers_path, headers: default_headers
      expect(response.body).to include(provider.name)
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get provider_path(provider), headers: default_headers
      expect(response).to have_http_status(:ok)
    end

    it 'returns the provider' do
      get provider_path(provider), headers: default_headers
      expect(response.body).to include(provider.name)
    end
  end

  describe 'POST #create' do
    let(:bank) { create(:bank) }
    let(:provider_params) do
      {
        name: 'Provider name',
        nit: '123456789-1',
        contact_name: 'Contact name',
        contact_phone: '1234567890',
        bank_account_attributes: {
          bank_id: bank.id,
          number: '1234567890'
        }
      }
    end

    it 'returns a success response' do
      post providers_path, params: { provider: provider_params }, headers: default_headers
      expect(response).to have_http_status(:created)
    end

    it 'creates a provider' do
      expect do
        post providers_path, params: { provider: provider_params }, headers: default_headers
      end.to change(Provider, :count).by(1)
    end

    it 'returns the provider' do
      post providers_path, params: { provider: provider_params }, headers: default_headers
      expect(response.body).to include(provider_params[:name])
    end
  end

  describe 'PUT #update' do
    let(:provider_params) { { name: 'Provider name 2' } }

    it 'returns a success response' do
      put provider_path(provider), params: { provider: provider_params }, headers: default_headers
      expect(response).to have_http_status(:ok)
    end

    it 'updates the provider' do
      put provider_path(provider), params: { provider: provider_params }, headers: default_headers
      expect(provider.reload.name).to eq(provider_params[:name])
    end
  end

  describe 'DELETE #destroy' do
    it 'returns a success response' do
      delete provider_path(provider), headers: default_headers
      expect(response).to have_http_status(:no_content)
    end

    it 'destroys the provider' do
      expect do
        delete provider_path(provider), headers: default_headers
      end.to change(Provider, :count).by(-1)
    end
  end
end
