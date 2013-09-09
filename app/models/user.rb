# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  user_type_id           :integer
#  articles_count         :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  role                   :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable#, :trackable, :validatable

  attr_accessible :articles_count, :name, :user_type_id, :email, :password, :remember_me, :password_confirmation, :role

  validates_presence_of :email, :name, :password
  validates :email, :email_format => true

  has_many :articles

  ROLES = %w[admin editor reporter guest]
  scope :editors, where("role = ?", "editor")
  scope :reporters, where("role = ?", "reporter")

  def role?(value)
  	role == value.to_s
  end

  def notify_via_email
    Notifier.editor_notification(self).deliver
  end

end
