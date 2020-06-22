class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tickets
  has_many :creeks
  enum role: { viewer: 0, streamer: 1 }

  validates :username, presence: true, uniqueness: true
end
