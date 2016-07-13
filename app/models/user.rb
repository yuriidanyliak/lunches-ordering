class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :set_admin_if_first_user

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
