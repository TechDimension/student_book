
class User < ActiveRecord::Base
    
    before_save :downcase_email
    validates :name,  presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 200 }

    validates :email, uniqueness: { case_sensitive: false }
    validates :password, :confirmation => true
    validates :password, length: { minimum: 5 }
    has_secure_password
    

    private 

    def downcase_email
        self.email = email.downcase
    end
end