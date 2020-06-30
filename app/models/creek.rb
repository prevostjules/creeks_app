class Creek < ApplicationRecord
  belongs_to :user
  has_many :tickets, dependent: :destroy
  has_many :users, through: :tickets
  belongs_to :category

  has_many :messages, dependent: :destroy

  has_one_attached :photo

  validates :photo, presence: true
  validates :category, presence: true
  validates :duration, presence: true
  validates :title, presence: true, length: { maximum: 150 }
  validates :description, presence: true, length: { maximum: 250 }
  validates :scheduledStartTime, presence: true
  validates :price, presence: true

  include AlgoliaSearch

  algoliasearch do
    attributes :title, :description
  end
end
