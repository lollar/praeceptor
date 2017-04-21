class AddSkillLevelTypeToProjects < ActiveRecord::Migration[5.1]
  def change
    create_new_type
    add_column :projects, :skill_level, :skill_level, null: false, default: 'novice', index: true
  end

  private

  def create_new_type
    execute("CREATE TYPE skill_level AS ENUM ('novice', 'junior', 'mid-level', 'senior');")
  end
end
