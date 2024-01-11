class DashboardController < ApplicationController
  def index
    respond_to do |format|
      format.html do
        @banks_total = Bank.all.size
        @providers_total = Provider.all.size
      end
    end
  end
end
