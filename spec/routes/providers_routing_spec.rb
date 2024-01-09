describe 'routing to providers', type: :routing do
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
end
