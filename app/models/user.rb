class User < ApplicationRecord
	has_secure_password
	has_many :posts, dependent: :destroy
	has_many :events
	has_many :likes, dependent: :destroy
	has_many :comments
	mount_uploader :image,ImageUploader

end
