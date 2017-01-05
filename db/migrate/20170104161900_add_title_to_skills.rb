class AddTitleToSkills < ActiveRecord::Migration[5.0]
  def change
    add_column :skills, :title, :string
  end
end
