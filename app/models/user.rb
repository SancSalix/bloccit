class User < ActiveRecord::Base
   has_many :posts, dependent: :destroy
   has_many :comments, dependent: :destroy
   has_many :votes, dependent: :destroy
    
    before_save { self.email = email.downcase if email.present? }
    before_save :capitalize_user
    before_save { self.role ||= :member }
    
    validates :name, length: { minimum: 1, maximum: 100 }, presence: true
    validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
    validates :password, length: { minimum: 6 }, allow_blank: true
    validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 254 }
    has_secure_password
    
    enum role: [:member, :admin, :moderator]
    
    def capitalize_user
        temporary_name = []
        if name.present?
           temporary_name = name.split
           temporary_name.each do |temp|
               temp.capitalize!
           end
           self.name = temporary_name.join(" ")
        end
    end
end
