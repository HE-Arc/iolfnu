class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :authentication_keys => [:name]

  has_many :albums, dependent: :destroy
  validates_uniqueness_of :name
  validates_uniqueness_of :email

  def to_param
    name
  end

  # Important note: If you use validatable module, define email_required? and email_changed?:
  # from: https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-sign-in-with-something-other-than-their-email-address
  def email_required?
    false
  end

  def email_changed?
    false
  end

end
