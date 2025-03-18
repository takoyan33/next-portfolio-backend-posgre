class FrontSkill < ApplicationRecord
  validates :id, presence: true
  validates :name, presence: true
  validates :tag, presence: true
  validates :about, presence: true
  validates :icon, presence: true
end
