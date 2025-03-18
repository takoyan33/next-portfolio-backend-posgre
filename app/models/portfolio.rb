class Portfolio < ApplicationRecord
  validates :name, presence: true
  validates :date, presence: true
  validates :tag, presence: true
  validates :about, presence: true
  validates :function, presence: true
  validates :appeal, presence: true
  validates :front_skill, presence: true
  validates :back_skill, presence: true
  validates :infra_skill, presence: true
  validates :time, presence: true
end
