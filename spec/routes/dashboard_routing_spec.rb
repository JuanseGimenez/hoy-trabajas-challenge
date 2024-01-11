describe 'routing to dashboard', type: :routing do
  it 'routes /dashboard to dashboard#index' do
    expect(get: '/dashboard').to route_to(
      controller: 'dashboard',
      action: 'index'
    )
  end
end
