class Note < ActiveRecord::Base
    belongs_to :user
    belongs_to :chatroom
    has_many :likes, dependent: :destroy
    validates :content, presence: true
    validates :user_id, presence: true
end
