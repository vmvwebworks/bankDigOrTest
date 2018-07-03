class TransfersController < ApplicationController
  before_action :authenticate_user!
  def index
  end
  def new
  end
  def create
    transfer = current_user.transfers.new(transfer_params)
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
  private
    def transfer_params
      params.require(:transfer).permit(:sender, :receiver, :money, :currency, :user_ids)
    end
end
