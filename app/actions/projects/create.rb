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
      return 'Completed Successfully' if project.valid?

      project.full_errors.join(', ')
    end
  end
end
