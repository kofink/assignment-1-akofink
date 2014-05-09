class Recipe < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true

  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for :images, allow_destroy: true

  self.per_page = 12

  scope :filter, ->(filter='') do
    filter = "%#{filter}%"
    where(
      "title ilike ? OR body ilike ?",
      filter,
      filter
    )
  end
end
