class Podcast < ApplicationRecord
    has_one_attached :file

    validates :name, presence: true

    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy


    def countLike
        self.likes.count
        
    end
end
