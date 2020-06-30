class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tickets, dependent: :destroy
  has_many :creeks, dependent: :destroy
  enum role: { viewer: 0, streamer: 1 }
  belongs_to :category, optional: true

  has_one_attached :photo

  validates :username, presence: true, uniqueness: true
  validates :description, presence: true, on: :update, if: :is_streamer?
  validates :photo, if: :is_streamer?, presence: true
  validates :category, if: :is_streamer?, on: :update, presence: true

  include AlgoliaSearch

  algoliasearch do
    attributes :username
    attributes :role
    # attributeForDistinct "1"
  end


  private

  def is_streamer?
    self.streamer?
  end

  def is_viewer?
    self.viewer?
  end


end
