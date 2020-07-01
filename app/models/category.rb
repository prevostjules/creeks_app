class Category < ApplicationRecord
  has_many :creeks

  has_one_attached :photo

  validates :name, presence: true

  include AlgoliaSearch

  algoliasearch do
    attributes :name
  end

  Category.reindex

end
