class Contact < ApplicationRecord
  validates :nom, presence: true
  validates :prenom, presence: true
  validates :email, presence: true
end
