class Api::V1::AuthController < ApplicationController
    before_action :set_auth, only: %i[ show update destroy ]
  
    # POST /auth/login
    def login 
      @user = User.find(params[:username])
      if @user.authenticate(params[:password])
        token = jsonWebToken.encode(user_name:@user.username, id: @user.id)
        render json:{token:token}, status: :ok
      else
        render json: {error: 'Invalid username or password'}, status: :unauthorized
    end

    # POST /auth/register
    def register 
        @user = User.find(params[:username])
        if @user.authenticate(params[:password])
            token = jsonWebToken.encode(user_name:@user.username, id: @user.id)
            render json:{token:token}, status: :ok
        else
            render json: {error: 'Invalid username or password'}, status: :unauthorized
        end
    end
end
  