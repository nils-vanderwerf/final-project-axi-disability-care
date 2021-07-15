class User < ApplicationRecord
    # password will be salted, wants a password and password_confirmation
    has_secure_password 

    validates_presence_of :email
    validates_uniqueness_of :email
end
