class ProjectsController < ApplicationController
before_action :read_projects
	def index
		render json: @projects
	end

	def show
		found_project = @projects.find do |project|
			project["id"] == params[:id].to_i
		end
		render json: found_project
	end

	def read_projects
		@projects = JSON.parse(File.read(Rails.public_path.join("projects.json")))
	end
end
