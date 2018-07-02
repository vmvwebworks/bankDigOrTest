class TransfersController < ApplicationController
  before_action :authenticate_user!
  def index
  end
  def new
  end
  def create
    current_user.transfers.send_money(params[:sender], params[:receiver], params[:money], params[:currency])
    redirect_to root_path
  end
  def show
  end
end
