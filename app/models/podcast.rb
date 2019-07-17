class Podcast < ApplicationRecord
    has_one_attached :file

    validates :name, presence: true

    belongs_to :user
    has_many :comments, dependent: :destroy
end
