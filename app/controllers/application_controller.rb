class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception, prepend: true, unless: -> { request.format.json? }

   include Pundit

   rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


   private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to root_path
  end
end
