class Account::AddressesController < ApplicationController
  before_action :authenticate_user!

  def index
    @addresses = Address.all
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.user = current_user
    if @address.save
      redirect_to account_addresses_path
    else
      render :new
    end
  end

  private

  def address_params
    params.require(:address).permit(:real_name, :phone_number, :address_info)
  end
end
