class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
      if @project.save
        flash[:notice] = "Project has been created."
        redirect_to @project
      else
        flash[:alert] = "Project could not be saved"
        render action: "new"
      end
    end

  def show
    @project = Project.find(params[:id])
  end
end
