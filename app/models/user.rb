class User < ApplicationRecord
  include Toggleable

  EMAIL_PATTERN       = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z0-9][-a-z0-9]+)\z/i
  SCREEN_NAME_PATTERN = /\A[a-z0-9_]{1,30}\z/i

  toggleable %i(allow_login bot email_confirmed phone_confirmed allow_mail hide_profile)

  has_secure_password

  mount_uploader :image, AvatarUploader

  belongs_to :agent, optional: true
  has_many :tokens, dependent: :delete_all

  before_save { self.slug = screen_name.downcase unless screen_name.nil? }

  validates_presence_of :screen_name, :email
  validates_format_of :screen_name, with: SCREEN_NAME_PATTERN
  validates_format_of :email, with: EMAIL_PATTERN
  validates :screen_name, uniqueness: { case_sensitive: false }
  validates :email, uniqueness: { case_sensitive: false }

end
