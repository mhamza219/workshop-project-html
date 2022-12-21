class WorkshopsController < ApplicationController

	before_action :authenticate_user!
	before_action :set_project
  before_action :set_workshop, only: %i[ show edit update destroy ]

	def index
		# byebug
		@workshops = @project.workshops
	end

	def new
		@workshop = @project.workshops.build
	end

	def show
		# @workshop = @project.workshops
	end

	def create
		@workshop = @project.workshops.build(workshop_params)
		@workshop.save
		redirect_to([@workshop.project, @workshop])
		# redirect_to @workshop
	end

	def edit
		
	end

	def update
		
		@workshop.update(workshop_params)
		redirect_to([@workshop.project, @workshop])
		# redirect_to "/workshops"
	end

	def destroy
		
		@workshop.destroy
		redirect_to @project
		# redirect_to "/workshops"
	end

	private

	def set_project
      @project = current_user.projects.find(params[:project_id])
    end

	def set_workshop
		@workshop = @project.workshops.find(params[:id])
	end

	def workshop_params
		params.require(:workshop).permit(:name, :project_id)
	end
end
