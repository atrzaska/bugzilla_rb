class MemberMailer < ActionMailer::Base
  default from: "bugzilla@bugzilla.com"

  def send_activation_instructions(member)
    @member = member
    mail to: @member.email, subject: 'Confirm member'
  end
end