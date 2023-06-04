class ApplicationController < ActionController::API
    
    SECRET_KEY =  Rails.application.secrets.secret_key_base

    def encode(payload, exp = 2.days.from.now)
        payload[:exp] = exp.to_i
        JWT.encode(payload, SECRET_KEY)
    end

    def decode(token)
        decode = JWT.decode(token, SECRET_KEY)
        HashWtihIndifferentAccess.new decoded
    end
end
