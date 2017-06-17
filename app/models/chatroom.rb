class Chatroom < ActiveRecord::Base
    has_many :notes
    has_many :favorites, dependent: :destroy
    validates :title, presence: true
end
