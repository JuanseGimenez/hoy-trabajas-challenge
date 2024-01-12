json.total_pages @providers.total_pages
json.next providers_path(page: @providers.next_page, format: :json) if @providers.try(:next_page)
json.previous providers_path(page: @providers.previous_page, format: :json) if @providers.try(:previous_page)

json.providers do |_provider|
  json.array! @providers, partial: 'providers/provider', as: :provider
end
