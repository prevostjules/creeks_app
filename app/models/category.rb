class Category < ApplicationRecord
  has_many :creeks
  has_many :users

  validates :name, presence: true
end
