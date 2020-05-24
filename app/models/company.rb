class Company < ApplicationRecord
  validates_uniqueness_of :key
  has_many :category

  mount_uploader :picture, PictureUploader
end
