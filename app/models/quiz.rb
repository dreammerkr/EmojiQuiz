class Quiz < ApplicationRecord
    has_many :likes
    has_many :liked_users, through: :likes, source: :user
    belongs_to :user
    
    before_destroy { |quiz| quiz.likes.destroy }
    
    def next
        self.class.where("id > ?", id).first
    end
    
    def previous
        self.class.where("id < ?", id).last
    end
    
    validates :answer,
        presence: true,
        length: { minimum: 1 }

end
