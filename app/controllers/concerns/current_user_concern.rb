module CurrentUserConcern
    extend ActiveSupport::Concern
  
    included do
      before_action :set_current_user
    end
  
    def set_current_user
      if session[:user_id]
        puts "Session id: #{session[:user_id]}"
        @current_user = User.find(session[:user_id])
      else
         p "cookies: #{cookies[:name]}"
          # user = User
          # .find_by(email: params["user"]["email"])
          # .try(:authenticate, params["user"]["password"])
          p "Found the user #{user}"
          if user
            @current_user = user
            session[:user_id] = user.id
        end
    end
end
end