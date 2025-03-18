class License < ApplicationRecord
  include CacheClearable
  validates :title, presence: true
  validates :date, presence: true
end
