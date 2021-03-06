class User < ApplicationRecord
  # has_secure_password is a built-in rails method that provides user authentication
  #features for the omdel called in
  # 1. It will automatically add a presence validator for password field.
  # 2. When given a password, it will generate a salt, then it will hash the salt and password combo, then store the result into the database field. The salt is just extra random data added to the password to incrypt it; to make it more secure. You use the gem 'bcrypt'.
  # 3 If you skip the password_confirmation field, it won't give you a validation error (on the backend) for it. If you provide a password_confirmation field it will validate the password against it.
  # 4 The user instance gets the method 'authenticate' which will allow to verify if a user entered the correct password. It returns the user if correct, otherwise it returns 'nil'.

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: VALID_EMAIL_REGEX

  before_validation :downcase_email

   has_many :questions, dependent: :nullify

   def full_name
     "#{first_name} #{last_name}"
   end

   private

   def downcase_email
     self.email&.downcase!
   end


end
