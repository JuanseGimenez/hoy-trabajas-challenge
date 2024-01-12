class ProvidersController < ApplicationController
  before_action :set_banks, only: %i[new create edit update]
  before_action :set_provider, only: %i[show edit update destroy]

  def index
    @providers = Provider
                 .includes(bank_account: :bank)
                 .paginate(page: params[:page])
  end

  def show; end

  def new
    @provider = Provider.new
    @provider.build_bank_account
  end

  def edit; end

  def create
    @provider = Provider.new(provider_params)

    respond_to do |format|
      if @provider.save
        format.html { redirect_to providers_path, notice: I18n.t('provider.message_created') }
        format.json { render :show, status: :created, location: @provider }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @provider.update(provider_params)
        format.html { redirect_to providers_path, notice: I18n.t('provider.message_updated') }
        format.json { render :show, status: :ok, location: @provider }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy # rubocop:disable Metrics/MethodLength
    respond_to do |format|
      if @provider.destroy
        format.html { redirect_to providers_path, notice: I18n.t('provider.message_destroyed') }
        format.json { head :no_content }
      else
        format.html { redirect_to providers_path, notice: I18n.t('provider.message_not_destroyed') }
        format.json do
          render json: { message: I18n.t('provider.message_not_destroyed') }, status: :unprocessable_entity
        end
      end
    end
  end

  private

  def provider_params
    params.require(:provider).permit(:name, :nit, :contact_name, :contact_phone,
                                     bank_account_attributes: %i[number bank_id])
  end

  def set_provider
    @provider = Provider.find(params[:id])
  end

  def set_banks
    @banks = Bank.all
  end

  def record_not_found
    render json: { error: I18n.t('provider.not_found') }, status: :not_found
  end
end
