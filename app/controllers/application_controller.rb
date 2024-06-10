class ApplicationController < ActionController::Base
   include DeviseTokenAuth::Concerns::SetUserByToken
   protect_from_forgery with: :exception, prepend: true, unless: -> { request.format.json? }
end
