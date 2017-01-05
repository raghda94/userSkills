class AddColumnsToUserSkills < ActiveRecord::Migration[5.0]
  def change
    add_column :user_skills, :user_id, :integer
    add_column :user_skills, :skill_id, :integer
  end
end
