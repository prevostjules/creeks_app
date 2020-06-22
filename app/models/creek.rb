class Creek < ApplicationRecord
  belongs_to :user
  has_many :tickets

  validates :title, presence: true
  validates :description, presence: true
  validates :scheduledStartTime, presence: true
  validates :price, presence: true

end
