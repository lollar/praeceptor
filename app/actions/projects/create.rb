module Projects
  class Create
    def self.run(attributes)
      new(attributes).run
    end

    def initialize(attributes)
      @attributes = attributes
    end

    def run
      build_new_project
      Arbitrium::Result.new(save_project!, result_message, project)
    end

    private

    attr_reader :project, :attributes

    def build_new_project
      @project = Project.new(attributes)
    end

    def save_project!
      begin
        project.save
      rescue ActiveRecord::NotNullViolation 
        false
      end
    end

    def result_message
      if project_form.valid?
        'Completed Successfully'
      else
        project_form.errors.full_messages.join(', ')
      end
    end

    def project_form
      @project_form ||= ProjectForm.new(project.attributes.slice('title', 'requirements', 'skill_level'))
    end
  end
end
