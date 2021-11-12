class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :access_denied
  after_action :verify_authorized
  
  private

  def access_denied
    head(:forbidden)
  end
end
