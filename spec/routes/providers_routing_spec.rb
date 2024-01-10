describe 'routing to providers', type: :routing do
  it 'routes /providers to providers#index' do
    expect(get: '/providers').to route_to(
      controller: 'providers',
      action: 'index'
    )
  end

  it 'routes /providers/new to providers#new' do
    expect(get: '/providers/new').to route_to(
      controller: 'providers',
      action: 'new'
    )
  end

  it 'routes /providers to providers#create' do
    expect(post: '/providers').to route_to(
      controller: 'providers',
      action: 'create'
    )
  end

  it 'routes /providers/1/edit to providers#edit' do
    expect(get: '/providers/1/edit').to route_to(
      controller: 'providers',
      action: 'edit',
      id: '1'
    )
  end

  it 'routes /providers/1 to providers#update' do
    expect(put: '/providers/1').to route_to(
      controller: 'providers',
      action: 'update',
      id: '1'
    )
  end

  it 'routes /providers/1 to providers#destroy' do
    expect(delete: '/providers/1').to route_to(
      controller: 'providers',
      action: 'destroy',
      id: '1'
    )
  end
end
