class Job < ApplicationRecord
  validates :title, presence: true
  validates :date, presence: true
  validates :body, presence: true
end
