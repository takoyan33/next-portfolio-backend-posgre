class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :date, presence: true
end
