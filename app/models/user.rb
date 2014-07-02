class User < ActiveRecord::Base
  has_many :members
  has_many :projects, through: :members

  after_create :check_invitation

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def check_invitation
    members = Member.where(email: self.email)
    members.each do |member|
      member.update(user: self)
    end
  end
end
