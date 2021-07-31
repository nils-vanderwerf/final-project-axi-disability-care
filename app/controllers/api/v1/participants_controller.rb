class Api::V1::ParticipantsController < ApplicationController
    def new
    end
  
    def index
      participants = Carer.all
      if participants
        render json: {
          participants: participants
        }
      else
        render json: {
          status: 500,
          errors: ['no participants found']
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
      participant = Participant.new(carer_params)
  
      if carer.valid?
        participant = Participant.create(participant_params)
        participant.role = participant
        participant.save
        
        render json: {
          status: :created,
          carer: carer
        }
        else
          render json: { status: 500 }
        end
      end
  
    private 
  
    def participant_params
      params.require(:participant).permit(:ndis, :ndis_number, :disability, 
      user_attributes: [ :id, :email, :first_name, :last_name, :bio, :age, :gender,  
      :available_hours, :password, :password_confirmation, category_ids: [], address_attributes: [:city, :state, :zip_code] ])
    end
end
