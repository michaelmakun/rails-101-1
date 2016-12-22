class Group < ActiveRecord::Base
  belongs_to :user
  has_many :post
  validates :title, presence: true
end
