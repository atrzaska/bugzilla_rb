class Member < ActiveRecord::Base
  before_create :generate_token

  belongs_to :project
  belongs_to :user

  scope :confirmed, where(confirmed: true)

  private
  def generate_token
    self.token = Digest::SHA1.hexdigest([Time.now, rand].join)
  end
end