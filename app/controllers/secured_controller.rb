class SecuredController < ApplicationController
  before_action :authorize_request

  private
  
  def authorize_request
    AuthorizationService.new(request.headers).authorize_request!
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :Unauthorized
  end
end
