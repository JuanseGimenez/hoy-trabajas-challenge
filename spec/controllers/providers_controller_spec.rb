describe ProvidersController do
  before { sign_in }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(assigns(:providers)).to eq([])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    let(:provider) { create(:provider) }

    it 'returns a success response' do
      get :show, params: { id: provider.id }
      expect(assigns(:provider)).to eq(provider)
    end

    it 'renders the show template' do
      get :show, params: { id: provider.id }
      expect(response).to render_template(:show)
    end
  end

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

  describe 'GET #edit' do
    let(:provider) { create(:provider) }

    it 'returns a success response' do
      get :edit, params: { id: provider.id }
      expect(assigns(:provider)).to eq(provider)
    end

    it 'renders the edit template' do
      get :edit, params: { id: provider.id }
      expect(response).to render_template(:edit)
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
          number: '123456789012345',
          bank_id: bank.id
        }
      }
    end

    context 'with valid params' do
      it 'creates a new Provider' do
        expect do
          post :create, params: { provider: provider_params }
        end.to change(Provider, :count).by(1)
      end

      it 'creates a new BankAccount' do
        expect do
          post :create, params: { provider: provider_params }
        end.to change(BankAccount, :count).by(1)
      end

      it 'redirects to the created provider' do
        post :create, params: { provider: provider_params }
        expect(response).to redirect_to(providers_path)
      end
    end

    context 'with invalid params' do
      let(:provider_params) do
        {
          name: '',
          nit: '',
          contact_name: '',
          contact_phone: '',
          bank_account_attributes: {
            number: '',
            bank_id: ''
          }
        }
      end

      it 'does not create a new Provider' do
        expect do
          post :create, params: { provider: provider_params }
        end.not_to change(Provider, :count)
      end

      it 'does not create a new BankAccount' do
        expect do
          post :create, params: { provider: provider_params }
        end.not_to change(BankAccount, :count)
      end

      it 'renders the new template' do
        post :create, params: { provider: provider_params }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PUT #update' do
    let(:bank) { create(:bank) }
    let(:provider) { create(:provider) }
    let(:provider_params) do
      {
        name: 'Provider name',
        nit: '123456789-1',
        contact_name: 'Contact name',
        contact_phone: '1234567890',
        bank_account_attributes: {
          number: '123456789012345',
          bank_id: bank.id
        }
      }
    end

    context 'with valid params' do
      it 'redirects to the provider' do
        put :update, params: { id: provider.id, provider: provider_params }
        expect(response).to redirect_to(providers_path)
      end

      it 'updates the requested provider' do
        put :update, params: { id: provider.id, provider: provider_params }
        provider.reload
        expect(provider.name).to eq('Provider name')
      end
    end

    context 'with invalid params' do
      let(:provider_params) do
        {
          name: '',
          nit: '',
          contact_name: '',
          contact_phone: '',
          bank_account_attributes: {
            number: '',
            bank_id: ''
          }
        }
      end

      it 'renders the edit template' do
        put :update, params: { id: provider.id, provider: provider_params }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:provider) { create(:provider) }

    it 'redirects to the providers list' do
      delete :destroy, params: { id: provider.id }
      expect(response).to redirect_to(providers_path)
    end

    it 'destroys the requested provider' do
      expect do
        delete :destroy, params: { id: provider.id }
      end.to change(Provider, :count).by(-1)
    end
  end
end
