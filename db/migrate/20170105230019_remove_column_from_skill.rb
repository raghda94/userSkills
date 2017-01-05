class RemoveColumnFromSkill < ActiveRecord::Migration[5.0]
  def change
    remove_column :skills, :expertise_level
  end
end
