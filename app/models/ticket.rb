class Ticket < ApplicationRecord
  belongs_to :creek
  belongs_to :user

end
