class ProjectsController < ApplicationController

	before_action :authenticate_user!
  before_action :set_project, only: %i[ show edit update destroy ]

	def index
		@projects = current_user.projects
	end

	def new
		@project = current_user.projects.build
	end

	def show
		# byebug
	end

	def create
		@project = current_user.projects.new(project_params)
		@project.save
		redirect_to "/projects"
	end

	def edit
		
	end

	def update
		@project.update(project_params)
		redirect_to "/projects"
	end

	def destroy
		@project.destroy
		redirect_to "/projects"
	end

	private

	def set_project
		@project = current_user.projects.find(params[:id])
	end

	def project_params
		params.require(:project).permit(:name, :user_id, :image, :video)
	end

end
