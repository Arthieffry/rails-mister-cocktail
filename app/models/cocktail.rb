class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, dependent: :destroy, through: :doses

  validates :name, presence: true, uniqueness: true

  mount_uploader :photo, PhotoUploader
end
