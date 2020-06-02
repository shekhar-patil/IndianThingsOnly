class Company < ApplicationRecord
  validates_uniqueness_of :key
  validates :name, presence: :true
  has_many :categories

  mount_uploader :picture, PictureUploader
end
