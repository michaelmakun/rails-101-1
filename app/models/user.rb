class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :group_relationships
  has_many :particpated_groups, :through => :group_relationships, :source => :group
  has_many :posts

  def is_member_of?(group)
    particpated_groups.include?(group)
  end
  
  def join!(group)
    particpated_groups << group
  end

  def quit!(group)
    particpated_groups.delete(group)
  end

end
