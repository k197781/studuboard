class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :notes
    has_many :likes, dependent: :destroy
    has_many :like_notes, through: :likes, source: :note
    has_many :favorites, dependent: :destroy
    has_many :favorite_chatrooms, through: :favorites, source: :chatroom
    has_many :friendships_from_user, class_name: 'Friensdhip', foreign_key: 'from_user_id', dependent: :delete_all
    has_many :friendships_to_user, class_name: 'Friedship', foreign_key: 'to_user_id', dependent: :delete_all
    has_many :friendships_of_from_user, through: :friendships_from_userr, source: 'to_user'
    has_many :friendships_of_to_user, through: :friendships_to_user, source: 'from_user'
    validates :name, presence: true 
    validates :email, presence: true, uniqueness: true
    validates :studentType, presence: true
    
    
    def set_image(file)
        if !file.nil?
            file_name = file.original_filename

            File.open("public/user_images/#{file_name}", 'wb'){|f| f.write(file.read)}
        end
        
        self.image = file_name

    end
end
