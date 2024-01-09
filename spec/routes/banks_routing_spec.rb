describe 'routing to banks', type: :routing do
  it 'routes /banks to banks#index' do
    expect(get: '/banks').to route_to(
      controller: 'banks',
      action: 'index'
    )
  end

  it 'routes /banks/new to banks#new' do
    expect(get: '/banks/new').to route_to(
      controller: 'banks',
      action: 'new'
    )
  end

  it 'routes /banks to banks#create' do
    expect(post: '/banks').to route_to(
      controller: 'banks',
      action: 'create'
    )
  end

  it 'routes /banks/1 to banks#show' do
    expect(get: '/banks/1').to route_to(
      controller: 'banks',
      action: 'show',
      id: '1'
    )
  end

  it 'routes /banks/1/edit to banks#edit' do
    expect(get: '/banks/1/edit').to route_to(
      controller: 'banks',
      action: 'edit',
      id: '1'
    )
  end

  it 'routes /banks/1 to banks#update' do
    expect(put: '/banks/1').to route_to(
      controller: 'banks',
      action: 'update',
      id: '1'
    )
  end

  it 'routes /banks/1 to banks#destroy' do
    expect(delete: '/banks/1').to route_to(
      controller: 'banks',
      action: 'destroy',
      id: '1'
    )
  end
end
