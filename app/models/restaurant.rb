class Restaurant < ActiveRecord::Base
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :name, length: {minimum: 3}, uniqueness: true


  def build_review(attributes = {}, user)
    attributes[:user] ||= user
    reviews.build(attributes)
  end

  def owned_by?(user)
    user == self.user
  end

end
