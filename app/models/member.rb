class Member < ActiveRecord::Base
  include PublicActivity::Common

  before_create :generate_token

  belongs_to :project
  belongs_to :user

  validates :name, :email, presence: true
  validates :email, email_format: {}

  scope :confirmed, -> { where(confirmed: true) }

  private
  def generate_token
    self.token = Digest::SHA1.hexdigest([Time.now, rand].join)
  end
end
