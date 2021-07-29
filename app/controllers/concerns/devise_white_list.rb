module DeviseWhiteList
    extend ActiveSupport::Concern

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :last_name, :bio, :age, :gender, :hourly_rate, :hours_of_work, :first_aid_training, :carer_number, :has_vehicle, :disability, :ndis, :ndis_number, :password, :password_confirmation, category_ids:[], address_attributes: {})
    end
end