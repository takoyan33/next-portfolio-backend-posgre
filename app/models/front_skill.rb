class FrontSkill < ApplicationRecord
  validates :name, presence: true
  validates :rank, presence: true
  validates :tag, presence: true
  validates :about, presence: true
  validates :icon, presence: true
end
