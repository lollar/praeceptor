class ProjectForm
  include ActiveModel::Model
  
  SKILL_LEVELS = %w(novice junior mid-level senior)

  attr_accessor :title, :requirements, :skill_level

  validates :skill_level, presence: true, inclusion: { in: SKILL_LEVELS }
  validates :title, presence: true
  validates :requirements, presence: true
end
