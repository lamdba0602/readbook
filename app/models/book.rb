class Book < ApplicationRecord
  validates :name, presence: true
  validates :owner, presence: true
  validates :category_id, presence: true
  validates :description, presence: true

  belongs_to :category
  mount_uploader :image, ImageUploader

  def publish!
    self.status = true
    self.save
  end

  def hidden!
    self.status = false
    self.save
  end

  scope :published, -> { where(status: true) }
  scope :recent, -> { order("created_at DESC") }

end
