class InvitePartnerController < ApplicationController
  respond_to :json

  def create
    invite = params[:invite]
    Rails.logger.info "invite received #{invite}"
    to = invite[:email]
    user = Profile.find_by_id(invite[:id])
    respond_to do |format|
      if user.nil?
        format.json { render json: {status: 401, message: 'Could not find matching profile'} }
      else
        InvitePartner.invite_partner(user, to).deliver_later
        format.json { render json: {status: 200, message: 'Success!'} }
      end
    end
  end

end
