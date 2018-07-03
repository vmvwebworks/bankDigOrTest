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
  def send_money
    if is_intra_bank?
      intra_bank_op(money)
    end
    if is_inter_bank?
      # TODO Random here for % of fail
      inter_bank_op(money)
    end
  end

  def intra_bank_op(money)
    unless sender_user.money < money
      decrease = sender_user.money - money
      sender_user.update(money: decrease)
      receiver_user.update(money: receiver_user.money + money)
    end
  end

  def inter_bank_op(money)
    unless sender_user.money < money + 5 and money > 1000
      decrease = sender_user.money - money
      decrease = decrease - 5
      sender_user.update(money: decrease)
      receiver_user.update(money: receiver_user.money + money)
    end
  end
  # TODO create methods for change values fwhen they are other user currencies
end
