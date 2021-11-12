# frozen_string_literal: true

class Web::SessionsController < Web::ApplicationController
  def new; end

  def create
    user = User.find_by(params[:email])
    if user&.authenticate(params[:password])
      sign_in(user)
      redirect_to root_pathex
    else
      render action: :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
