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
      if transfer.it_fails?
        flash[:error] = "the inter-bank transfer failed and nothing was done, try it again"
        redirect_to transfers_path and return
      end
      flash[:success] = "Transaction succefully done"
    end
    transfer.send_money
    transfer.save
    transfer.create_history(bank_id: current_user.bank.id)
    redirect_to transfers_path
  end
  def show
  end
  private
    def transfer_params
      params.require(:transfer).permit(:sender, :receiver, :money, :currency, :user_ids)
    end
end
