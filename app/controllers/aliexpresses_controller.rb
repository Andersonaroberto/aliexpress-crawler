class AliexpressesController < ApplicationController
  before_action :set_aliexpress, only: [:edit, :update, :show, :destroy]
  def new
    @aliexpress = Aliexpress.new
  end

  def create
    @aliexpress = Aliexpress.create(aliexpress_params)
    respond_with @aliexpress
  end

  def edit
    respond_with @aliexpress
  end

  def update
    @aliexpress.update(aliexpress_params)
    respond_with @aliexpress
  end

  def show
    respond_with @aliexpress
  end

  def index
    @aliexpresses = Aliexpress.all.order(:name)
  end

  def destroy
    @aliexpress.destroy
    redirect_to aliexpresses_path, alert: "Configuração deletada"
  rescue
    redirect_to aliexpresses_path, alert: "Não é possível remover, está ligado a um Crawler, primeiro delete o Crawler"
  end

  private

  def set_aliexpress
    @aliexpress = Aliexpress.find(params[:id])
  end

  def aliexpress_params
    params.require(:aliexpress).permit(:name, :email, :password)
  end
end
