class Employee < ApplicationRecord
  before_save { code.upcase! }
  validates :code, presence: true, length: { maximum: 255 },
            uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true
end
