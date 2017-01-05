class Skill < ApplicationRecord
  has_many :user_skills
  has_many :users, through: :user_skills
  validates_inclusion_of :expertise_level, in: 1..5
end
