class Portfolio < ApplicationRecord
  validates :id, presence: true
  validates :name, presence: true
  validates :date, presence: true
  validates :tag, presence: true
  validates :about, presence: true
  validates :topImg, presence: true
  validates :function, presence: true
  validates :appeal, presence: true
  validates :front_skill, presence: true
  validates :back_skill, presence: true
end
