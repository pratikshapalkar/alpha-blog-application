module Api
  module V1
    module Override
      class SessionsController < DeviseTokenAuth::SessionsController

        def create
          if params[:user].present?
            @resource = resource_class.where(email: params[:user][:email]).first

            if @resource.valid_password?(params[:user][:password])
              ## Set New Token to User Object
              assign_new_tokens
              @resource.save

              sign_in(:user, @resource, store: false)

              render json: {
                code: 200,
                status: true,
                message: "Logged in successfully.",
                data: @resource.as_json
              }
            end
          else
            render json: {
              code: 400,
              status: false,
              message: "Please pass valid parameters",
              data: {}
            }, status: :bad_request
          end
        end

        def destroy
          
          super
        end

        private 

        def sign_in_params
          params.require(:user).permit(:email, :password)
        end

        ## Assign New Tokens
        def assign_new_tokens
          @token = DeviseTokenAuth::TokenFactory.create

          # store client + token in user's token hash
          @resource.tokens[@token.client] = {
            token:  @token.token_hash,
            expiry: @token.expiry
          }
        end

      end
    end
  end
end