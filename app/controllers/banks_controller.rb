class BanksController < ApplicationController
  before_action :set_bank, only: %i[show edit update destroy]

  def index
    @banks = Bank.all
  end

  def show; end

  def new
    @bank = Bank.new
  end

  def edit; end

  def create
    @bank = Bank.new(bank_params)

    respond_to do |format|
      if @bank.save
        format.html { redirect_to banks_path, notice: I18n.t('bank.message_created') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @bank.update(bank_params)
        format.html { redirect_to banks_path, notice: I18n.t('bank.message_updated') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bank.destroy

    respond_to do |format|
      format.html { redirect_to banks_path, notice: I18n.t('bank.message_destroyed') }
    end
  end

  private

  def set_bank
    @bank = Bank.find(params[:id])
  end

  def bank_params
    params.require(:bank).permit(:name)
  end
end
