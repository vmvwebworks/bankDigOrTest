class Bank < ApplicationRecord
  has_many :users
  has_many :histories
  has_many :transfers, through: :histories
end
