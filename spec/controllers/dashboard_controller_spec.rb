describe DashboardController do
  before { sign_in }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns @banks_total' do
      get :index
      expect(assigns(:banks_total)).to eq(Bank.count)
    end

    it 'assigns @providers_total' do
      get :index
      expect(assigns(:providers_total)).to eq(Provider.count)
    end
  end
end
