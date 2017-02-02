class User < ApplicationRecord
  belongs_to :agent
  has_secure_password
end
