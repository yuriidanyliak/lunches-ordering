class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :set_admin_if_first_user

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
end
