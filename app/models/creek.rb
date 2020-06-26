class Creek < ApplicationRecord
  belongs_to :user
  has_many :tickets, dependent: :destroy
  has_many :users, through: :tickets

  has_one_attached :photo

  validates :title, presence: true
  validates :description, presence: true
  validates :scheduledStartTime, presence: true
  validates :price, presence: true

  include AlgoliaSearch

  algoliasearch do
    attributes :title, :description
  end
end
