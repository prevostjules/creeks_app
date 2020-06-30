class Category < ApplicationRecord
  has_many :creeks
  has_many :users

  has_one_attached :photo

  validates :name, presence: true

  include AlgoliaSearch

  algoliasearch do
    attributes :name
  end

end
