class Api::V1::SessionsController < ApplicationController
    skip_before_action :authenticate_user!
    skip_before_action :authenticate_user_using_x_auth_token
    
    include CurrentUserConcern
        def create
            user = User.find_for_database_authentication(email: params[:user] && params[:user][:email])
            if invalid_password?(user)
              respond_with_error "Incorrect email or password", 401
            else
              sign_in(user)
              # render json: { auth_token: user.authentication_token, user: user, is_admin: user.super_admin? },
                      # location: root_path, status: :created
              render json: { auth_token: user.authentication_token, user: user },
                      location: root_path, status: :created
            end
        end

        def destroy
            sign_out(@user)
            reset_session
        end
    end