class Job < ApplicationRecord
  include CacheClearable
  validates :title, presence: true
  validates :date, presence: true
  validates :body, presence: true
end
