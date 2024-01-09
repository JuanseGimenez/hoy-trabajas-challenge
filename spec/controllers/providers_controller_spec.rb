describe ProvidersController do
  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(assigns(:provider)).to be_a_new(Provider)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
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
        bank_account_number: '1234567890',
        bank_id: bank.id
      }
    end

    context 'with valid params' do
      it 'creates a new Provider' do
        expect do
          post :create, params: { provider: provider_params }
        end.to change(Provider, :count).by(1)
      end

      it 'redirects to the created provider' do
        post :create, params: { provider: provider_params }
        expect(response).to redirect_to(providers_path)
      end
    end
  end
end
