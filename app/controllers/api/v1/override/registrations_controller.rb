module Api
  module V1
    module Override
      class RegistrationsController < DeviseTokenAuth::RegistrationsController


        def create
          @user = User.new(sign_up_params)

          if @user.save
            @user.update(role: 'user')
            render json: {
              code: 200,
              status: true,
              message: "User created successfully.",
              data: @user.as_json
            }, status: :ok
          else
            render json: {
              code: 500,
              status: false,
              message: "Something went wrong, please try again.",
              data: {}
            }, status: :internal_server_error
          end
        end

        private 

        def sign_up_params
          params.require(:user).permit(:email, :password, :phone_number, :name, :gender)
        end
      end
    end
  end
end