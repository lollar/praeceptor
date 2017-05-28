class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = ProjectForm.new
  end

  def create
    @action = Projects::Create.run(project_params)

    if @action.successful?
      redirect_to project_path(@action.object)
    else
      @project = @action.object
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :requirements, :skill_leve)
  end
end
