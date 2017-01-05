class AddColumnToUserSkills < ActiveRecord::Migration[5.0]
  def change
    add_column :user_skills, :expertise_level, :integer
  end
end
