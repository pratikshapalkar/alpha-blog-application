module Api
  module V1
    module Override
      class RegistrationsController < DeviseTokenAuth::RegistrationsController
      end
    end
  end
end