class User < ActiveRecord::Base

    has_secure_password

    before_validation :strip_whitespace

    validates :name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 5 }

    def self.authenticate_with_credentials params
        email = params[:email]
        email = email.strip unless email.nil?
        user = User.find_by_email(email)
        # If the user exists AND the password entered is correct.
        if user && user.authenticate(params[:password])
            return user
        else
            return nil
        end
    end

    def strip_whitespace
        self.email = self.email.strip unless self.email.nil?
    end
end
