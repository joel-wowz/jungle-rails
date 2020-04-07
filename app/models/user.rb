class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :email
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, :uniqueness => {:case_sensitive => false}
  validates :password, presence: true, :length => {:minimum => 5}

  def authenticate_with_credentials(email, password)
    user_email = email.downcase.strip
    user = User.find_by_email(user_email)
    user && user.authenticate(password) ? user : nil
  end
end
