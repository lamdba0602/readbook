class Order < ApplicationRecord
  belongs_to :user
  has_many :book_lists

  validates :total, presence: true
  validates :user_id, presence: true
  validates :user_id, presence: true
end
