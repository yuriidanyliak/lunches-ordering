class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :set_admin_if_first_user, :set_access_token

  has_many :orders

  private

  def set_admin_if_first_user
    AdminUser.new(admin_credentials).save(validate: false) if User.count == 0
  end

  def admin_credentials
    {
        email: email,
        encrypted_password: encrypted_password
    }
  end

  def set_access_token
    self.access_token = generate_token
  end

  def generate_token
    loop do
      token = SecureRandom.hex(10)
      break token unless User.where(access_token: token).exists?
    end
  end

end
