class Order < ApplicationRecord
  belongs_to :user

  validates :total, presence: true
  validates :user_id, presence: true
  validates :user_id, presence: true
end
