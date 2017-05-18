class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = ProjectForm.new
  end

  def create
  end
end
