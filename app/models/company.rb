class Company < ApplicationRecord
  validates_uniqueness_of :key
  has_many :categories

  mount_uploader :picture, PictureUploader
end
