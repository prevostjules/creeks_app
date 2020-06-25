class Creek < ApplicationRecord
  belongs_to :user
  has_many :tickets, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :scheduledStartTime, presence: true
  validates :price, presence: true

  include AlgoliaSearch

  algoliasearch do
    attributes :title, :description
  end
end
