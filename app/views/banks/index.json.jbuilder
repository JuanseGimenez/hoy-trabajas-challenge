json.total_pages @banks.total_pages
json.next banks_path(page: @banks.next_page) if @banks.try(:next_page)
json.previous banks_path(page: @banks.previous_page) if @banks.try(:previous_page)

json.banks do |_bank|
  json.array! @banks, partial: 'banks/bank', as: :bank
end
