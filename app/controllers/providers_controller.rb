class ProvidersController < ApplicationController
  before_action :set_banks, only: %i[new create]

  def new
    @provider = Provider.new
    @provider.build_bank_account
  end

  def create
    @provider = Provider.new(provider_params)

    respond_to do |format|
      if @provider.save
        format.html { redirect_to providers_path, notice: I18n.t('provider.message_created') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def provider_params
    params.require(:provider).permit(:name, :nit, :contact_name, :contact_phone,
                                     bank_account_attributes: %i[number bank_id])
  end

  def set_banks
    @banks = Bank.all
  end
end
