class Transfer < ApplicationRecord
  has_and_belongs_to_many :users
  has_one :history
  scope :intra_banks, -> { where(trans_type: "Intra-bank")}
  scope :inter_banks, -> { where(trans_type: "Inter-bank")}
  scope :as_sender, -> {where(sender: current_user.id)}
  scope :as_receiver, -> {where(receiver: current_user.id)}

  def is_intra_bank?
    trans_type == "Intra-bank"
  end
  def is_inter_bank?
    trans_type == "Inter-bank"
  end
  def sender_user
    User.find(sender)
  end
  def receiver_user
    User.find(receiver)
  end
  def sndr_user(user_id)
    User.find(user_id)
  end
  def rcvr_user(user_id)
    User.find(user_id)
  end
  def send_money(sndr_id, rcvr_id, transfer_ammount, currency)
    if sndr_user(sndr_id).bank.name == rcvr_user(rcvr_id).bank.name
      inter_bank_op(sndr_id, rcvr_id, transfer_ammount, currency)
    else
      intra_bank_op(sndr_id, rcvr_id, transfer_ammount, currency)
    end
    # The transfer it will created once the filter becomes defined
  end

  def intra_bank_op(sndr_id, rcvr_id, transfer_ammount, currency)
    unless sndr_user(sndr_id).money < transfer_ammount
      decrease = sndr_user(sndr_id).money - transfer_ammount
      sndr_user(sndr_id).transfers.create(sender: sndr_id, receiver: rcvr_id, money: transfer_ammount, currency: currency, trans_type: "Intra-bank", user_ids: [rcvr_id])
      sender_user.update(money: decrease)
      receiver_user.update(money: transfer_ammount)
    end
  end

  def inter_bank_op(sndr_id, rcvr_id, transfer_ammount, currency)
    unless sndr_user(sndr_id).money < transfer_ammount + 5 and transfer_ammount > 1000
      decrease = sndr_user(sndr_id).money - transfer_ammount
      decrease = decrease - 5
      sndr_user(sndr_id).transfers.create(sender: sndr_id, receiver: rcvr_id, money: transfer_ammount, currency: currency, trans_type: "Inter-bank", user_ids: [rcvr_id])
      sndr_user(sndr_id).update(money: decrease)
      rcvr_user(rcvr_id).update(money: transfer_ammount)
      # TODO create methods for change values fwhen they are other user currencies
    end
  end
end
