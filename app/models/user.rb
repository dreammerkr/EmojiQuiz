class User < ApplicationRecord
    has_secure_password
    
    has_many :likes
    has_many :liked_posts, through: :likes, source: :quiz
    
    def is_like?(quiz)
        Like.find_by(user_id: self.id, quiz_id: quiz.id).present?
    end
end
