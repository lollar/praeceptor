class ProjectForm
  include ActiveModel::Model
  
  SKILL_LEVELS = %w(novice junior mid-level senior)

  attr_accessor :title, :requirements, :skill_level

  validates :skill_level, presence: true, inclusion: { in: SKILL_LEVELS }
  validates :title, presence: true
  validates :requirements, presence: true

  def self.valid?(project_instance)
    new(project_instance.attributes.slice('title', 'requirements', 'skill_level')).valid?
  end
end
