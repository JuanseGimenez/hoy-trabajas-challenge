describe BanksController do
  describe 'GET #index' do
    let(:bank) { create(:bank) }

    it 'returns a success response' do
      get :index
      expect(assigns(:banks)).to eq([bank])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    let(:bank) { create(:bank) }

    it 'returns a success response' do
      get :show, params: { id: bank.id }
      expect(assigns(:bank)).to eq(bank)
    end

    it 'renders the show template' do
      get :show, params: { id: bank.id }
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(assigns(:bank)).to be_a_new(Bank)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #edit' do
    let(:bank) { create(:bank) }

    it 'returns a success response' do
      get :edit, params: { id: bank.id }
      expect(assigns(:bank)).to eq(bank)
    end

    it 'renders the edit template' do
      get :edit, params: { id: bank.id }
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST #create' do
    let(:bank_params) { { name: 'Bank of America' } }

    context 'with valid params' do
      it 'creates a new Bank' do
        expect do
          post :create, params: { bank: bank_params }
        end.to change(Bank, :count).by(1)
      end

      it 'redirects to the created bank' do
        post :create, params: { bank: bank_params }
        expect(response).to redirect_to(banks_path)
      end
    end

    context 'with invalid params' do
      it 'returns a fails response (i.e. to display the new template)' do
        post :create, params: { bank: { name: nil } }
        expect(response).to be_unprocessable
      end

      it 'does not create a new Bank' do
        expect do
          post :create, params: { bank: { name: nil } }
        end.not_to change(Bank, :count)
      end
    end
  end

  describe 'PUT #update' do
    let(:bank) { create(:bank) }

    context 'with valid params' do
      let(:new_attributes) { { name: 'Bank of America' } }

      it 'updates the requested bank' do
        put :update, params: { id: bank.id, bank: new_attributes }
        bank.reload
        expect(bank.name).to eq('Bank of America')
      end

      it 'redirects to the bank' do
        put :update, params: { id: bank.id, bank: new_attributes }
        expect(response).to redirect_to(banks_path)
      end
    end

    context 'with invalid params' do
      it 'returns a fails response (i.e. to display the edit template)' do
        put :update, params: { id: bank.id, bank: { name: nil } }
        expect(response).to be_unprocessable
      end
    end
  end
end
