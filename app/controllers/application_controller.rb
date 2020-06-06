class ApplicationController < ActionController::Base
  def login_requied
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
