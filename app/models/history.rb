class History < ApplicationRecord
  belongs_to :transfer
  belongs_to :bank
  # TODO has_and_belongs_to_many banks? sender and receiver
end
