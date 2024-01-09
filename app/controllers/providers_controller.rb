class ProvidersController < ApplicationController
  def new
    @provider = Provider.new
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
    params.require(:provider).permit(:name, :nit, :contact_name,
                                     :contact_phone, :bank_account_number, :bank_id)
  end
end
