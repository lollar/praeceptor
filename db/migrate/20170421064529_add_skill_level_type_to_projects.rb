class AddSkillLevelTypeToProjects < ActiveRecord::Migration[5.1]
  def up 
    create_new_type
    add_column :projects, :skill_level, :skill_level, null: false, default: 'novice', index: true
  end

  def down
    remove_column :projects, :skill_level
    destroy_skill_level_type
  end

  private

  def create_new_type
    execute("CREATE TYPE skill_level AS ENUM ('novice', 'junior', 'mid-level', 'senior');")
  end

  def destroy_skill_level_type
    execute("DROP TYPE skill_level;")
  end
end
