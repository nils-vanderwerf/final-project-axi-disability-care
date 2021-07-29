
module CurrentUserConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user
  end

  def set_current_user
    puts "user:", session[:user_id]
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end
end

  
  #   def set_current_user
  #     puts "user nil: #{@@user.nil?}" 
  #     if @@user.nil? 
  #       @@user = User.find_by(email: params["user"]["email"])
  #       .try(:authenticate, params["user"]["password"])
  #     end
  #     puts "User after condition: #{@@user}"
    #   if session[:user_id]
    #     puts "Session id: #{session[:user_id]}"
    #     @current_user = User.find(session[:user_id])
    #   else 
    #     puts "not working"
    #   end
  #   end
  # end
  