class Company < ApplicationRecord
  validates_uniqueness_of :key
  validates :name, presence: :true

  mount_uploader :picture, PictureUploader
end
