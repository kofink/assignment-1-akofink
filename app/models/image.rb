class Image < ApplicationRecord
  mount_uploader :data, ImageUploader

  validates_presence_of :data

  belongs_to :recipe
  belongs_to :user

  def thumb
    data.thumb
  end
end
