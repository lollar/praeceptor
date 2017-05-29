class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = ProjectForm.new
  end

  def create
    @action = Projects::Create.run(project_form_params)

    if @action.successful?
      redirect_to project_path(@action.object)
    else
      @project = @action.object
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  private

  def project_form_params
    params.require(:project_form).permit(:title, :requirements, :skill_level)
  end
end
