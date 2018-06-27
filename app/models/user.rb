class User < ApplicationRecord
  validates :bank,  presence: true
  has_and_belongs_to_many :transfers
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
