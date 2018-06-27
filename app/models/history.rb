class History < ApplicationRecord
  belongs_to :transfer
  belongs_to :bank
end
