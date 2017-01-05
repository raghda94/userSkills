class UserSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  validates_inclusion_of :expertise_level, in: 1..5
end
