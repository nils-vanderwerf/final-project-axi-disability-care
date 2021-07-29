class RegistrationsController < ApplicationController

    private
def sign_up_params    
    resource_params.permit(:email, :first_name, :last_name, :bio, :age, :gender, :hourly_rate, :hours_of_work, :first_aid_training, :carer_number, :has_vehicle, :disability, :ndis, :ndis_number, :password, :password_confirmation, category_ids:[], address_attributes: {})
end

def resource_params
    params.require(:user)
end
  
    #   def load_resource
    #     self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    #   end
end
