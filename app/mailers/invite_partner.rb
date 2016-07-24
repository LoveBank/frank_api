class InvitePartner < ApplicationMailer
  default :from => 'report@treasury.love'

  # send invite
  def invite_partner(from, email)
    @from = from
    mail( :to => email,
          :subject => "#{@from.firstname} would like to invite you to join Love Bank" )
  end
end
