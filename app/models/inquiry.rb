class Inquiry < ApplicationRecord
  validates :email, presence: true
  validates :content, presence: true
end
