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
end
