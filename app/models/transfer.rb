class Transfer < ApplicationRecord
  has_and_belongs_to_many :users
  has_one :history
end
