class User < ActiveRecord::Base
    has_secure_password

    has_many :reviews

    validates :email, uniqueness: { case_sensitive: false }, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :password, length: {minimum: 3}
    validates :password_confirmation, length: {minimum: 3}   
    
    def self.authenticate_with_credentials(email, password)
        user = User.find_by_email(email)
  
        if user && user.authenticate(password)
          user
        else
          nil
        end 
    end

end
