class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :attach_avatar, only: [:create]

  def new
  end

  def index
    users = User.all
    if users
      render json: {
        users: users
      }
    else
      render json: {
        status: 500,
        errors: ['no users found']
      }
    end
  end

  def attach_avatar
    # Upload generic avatars, later to be replaced with what the user uploads
    puts "upload avatar"
    # if user.gender === 'Male'
    #   user.avatar.attach(
    #     io: File.open('../../..//public/avatars/001_avatar_man_freepik.png'),
    #     filename: '001_avatar_man_freepik.png',
    #     content_type: 'application/png'
    #   )
    #   elsif user.gender === 'Female'
    #     user.avatar.attach(
    #       io: File.open('../../..//public/avatars/002-avatar_woman_freepik.png'),
    #       filename: '002_avatar_woman_freepik.png',
    #       content_type: 'application/png'
    #     )
    #   else
    #     user.avatar.attach(
    #     io: File.open('../../..//public/avatars/003-avatar_other_freepik.png'),
    #     filename: '003-avatar_other_freepik.png',
    #     content_type: 'application/png'
    #     )

  end

  def create
    user = User.new(user_params)
    

    if user.valid?
        user.save

        session[:user_id] = user.id
        puts "Session ID after signup >> #{session[:id]}"
        render json: {
          status: :created,
          user: user
        }
      else
        render json: { status: 500 }
      end
    end

  private 
  def user_params
    params.require(:user).permit(:role, :email, :first_name, :last_name, :bio, :age, :gender, :available_hours, :password, :password_confirmation, category_ids:[], address_attributes: [:city, :state, :zip_code])
  end

  # def participant_params
  #   params.require(:carer).permit(:hourly_rate, :first_aid_training, :has_vehicle, :carer_number, 
  #   user_attributes: [ :id, :email, :first_name, :last_name, :bio, :age, :gender,  
  #   :hours_of_work, :password, :password_confirmation, category_ids: [], address_attributes: [:city, :state, :zip_code] ])
  # end

  # def participant_params
  #   params.require(:participant).permit(:ndis, :ndis_number, :disability)
  # end

  # def carer_params
  #   params.require(:carer).permit(:hourly_rate, :first_aid_training, :has_vehicle, :carer_number)
  # end

  # def participant_params
  #   params.require(:participant).permit(:ndis, :ndis_number, :disability)
  # end
end

