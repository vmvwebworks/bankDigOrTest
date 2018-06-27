class Bank < ApplicationRecord
  validates :name, presence: true
  has_many :users
  has_many :histories
  has_many :transfers, through: :histories
end
