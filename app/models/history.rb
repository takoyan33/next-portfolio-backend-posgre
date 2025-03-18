class History < ApplicationRecord
  validates :id, presence: true
  validates :title, presence: true
  validates :date, presence: true
  validates :body, presence: true
end
