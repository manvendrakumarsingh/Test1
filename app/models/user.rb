class User < ApplicationRecord
	has_secure_password

validates :first_name, presence: true,
                    length: { minimum: 3 ,maximum:30,:message => 'Name cannot be blank, Task not saved'}
      validates :last_name, presence: true,
                    length: { minimum: 3 ,maximum:30}
        validates_format_of :email, :with => /\A[\+A-Z0-9\._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}\z/i

             validates :password, format: {with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)./,

             message: "must include at least one lowercase letter, one uppercase letter, and one digit"}
	
	has_many :posts, dependent: :destroy
	has_many :events
	has_many :likes
	has_many :comments
	mount_uploader :image,ImageUploader

	
end
