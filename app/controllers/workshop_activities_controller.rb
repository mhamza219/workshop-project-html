class WorkshopActivitiesController < ApplicationController

	# before_action :authenticate_user!
	before_action :set_project, except: [:get_options]
	before_action :set_workshop, except: [:get_options]
  before_action :set_workshop_activity, only: %i[ show edit update destroy ]

	def index
		# byebug
		# workshop = @project.workshops.find(params[:workshop_id])

		@workshop_activities = @workshop.workshop_activities
	end

	def new
		@workshop_activity = @workshop.workshop_activities.build
	end

	def show
		# @workshop = @project.workshops
	end

	def create
		@workshop_activity = @workshop.workshop_activities.build(workshop_activity_params)
		@workshop_activity.save
		redirect_to([@workshop_activity.workshop.project, @workshop_activity.workshop, @workshop_activity])
		# redirect_to @workshop
	end

	def edit
		
	end

	def update
		
		@workshop_activity.update(workshop_activity_params)
		redirect_to([@workshop_activity.workshop.project, @workshop_activity.workshop, @workshop_activity])
		# redirect_to "/workshops"
	end

	def destroy
		
		@workshop_activity.destroy
		redirect_to project_workshop_workshop_activities_path
		# redirect_to "/workshops"
	end

	# def get_options
	# 	@data = params[:val].constantize.all
	# 	render json: @data.to_json 
	# end
  def get_options
    allowed_models = ["Poll", "Content", "Breakout", "Discussion"]
    Rails.logger.info "Fetching data for activity type: #{params[:val]}"  # Debugging log

    if allowed_models.include?(params[:val])
      @data = params[:val].constantize.select(:id, :name)
      render json: @data
    else
      render json: { error: "Invalid activity type" }, status: :unprocessable_entity
    end
  end

	private

	def set_project
      @project = current_user.projects.find(params[:project_id])
    end

	def set_workshop
		# byebug
		@workshop = @project.workshops.find(params[:workshop_id])
	end

	def set_workshop_activity
		@workshop_activity = @workshop.workshop_activities.find(params[:id])
	end

	def workshop_activity_params
		params.require(:workshop_activity).permit(:name, :workshop_id, :activity_type, :activity_id)
	end


end
