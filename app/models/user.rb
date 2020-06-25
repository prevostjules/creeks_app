class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tickets, dependent: :destroy
  has_many :creeks, dependent: :destroy
  enum role: { viewer: 0, streamer: 1 }

  validates :username, presence: true, uniqueness: true
  validates :description, presence: true, on: :update, if: :is_streamer?

  include AlgoliaSearch

  algoliasearch do
    attributes :username
  end


  private

  def is_streamer?
    self.streamer?
  end


end
