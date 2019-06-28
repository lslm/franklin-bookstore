class Page < ApplicationRecord
  belongs_to :user
  
  before_create :set_slug
  before_update :set_slug
  
  scope :published, -> {
    where(:published => true)
  }
  
  validates :name, presence: true, length: { in: 2..25 }, uniqueness: true
  validates :content, presence: true
  validates :user_id, presence: true

  def to_param
    slug
  end
  
  private

  def set_slug
    self.slug = self.name.parameterize
  end

end
