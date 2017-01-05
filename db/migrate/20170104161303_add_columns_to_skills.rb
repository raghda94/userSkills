class AddColumnsToSkills < ActiveRecord::Migration[5.0]
  def change
    add_column :skills, :expertise_level, :integer
  end
end
