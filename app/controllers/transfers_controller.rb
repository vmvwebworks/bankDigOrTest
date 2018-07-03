class TransfersController < ApplicationController
  before_action :authenticate_user!
  def index
  end
  def new
  end
  def create
    transfer = current_user.transfers.new(sender: params[:sender], receiver: params[:receiver], params[:money], currency: params[:currency], user_ids: [params[:sender], params[:receiver]])
    if transfer.sender_user.bank.name == transfer.receiver_user.bank.name
      transfer.trans_type = "Intra-bank"
    else
      transfer.trans_type = "Inter-bank"
    end
    transfer.send_money
    transfer.create_history(bank_id: bank.id)
    transfer.save
    redirect_to root_path
  end
  def show
  end
end
