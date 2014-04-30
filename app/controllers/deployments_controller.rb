class DeploymentsController < ApplicationController
  load_and_authorize_resource 

  before_action :set_deployment, only: [:show, :edit, :update, :destroy]

  # GET /deployments
  # GET /deployments.json
  def index
    @deployments = Deployment.all
  end

  # GET /deployments/1
  # GET /deployments/1.json
  def show
    @task_groups = @deployment.tasks.includes(:scenario).order('scenarios.priority ASC, LOWER(name) ASC').group_by {|t| t.group_id}
  end

  # GET /deployments/new
  def new
    @deployment = Deployment.new
  end

  # GET /deployments/1/edit
  def edit
  end

  # POST /deployments
  # POST /deployments.json
  def create
    @deployment = Deployment.new(deployment_params)
    @deployment.user_id = current_user.id

    respond_to do |format|
      if @deployment.save
        build_tasks(@deployment)

        format.html { redirect_to @deployment.project, notice: 'Deployment was successfully created.' }
        format.json { render :show, status: :created, location: @deployment }
      else
        format.html { render :new }
        format.json { render json: @deployment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deployments/1
  # PATCH/PUT /deployments/1.json
  def update
    respond_to do |format|
      if @deployment.update(deployment_params)
        format.html { redirect_to @deployment.project, notice: 'Deployment was successfully updated.' }
        format.json { render :show, status: :ok, location: @deployment }
      else
        format.html { render :edit }
        format.json { render json: @deployment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deployments/1
  # DELETE /deployments/1.json
  def destroy
    @deployment.destroy
    respond_to do |format|
      format.html { redirect_to deployments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deployment
      @deployment = Deployment.find(params[:id])
    end
    def build_tasks(deployment)
      deployment.project.scenarios.each do |scenario|
        task = deployment.tasks.build
        task.scenario_id = scenario.id
        task.deployment_id = deployment.id
        task.user_id = current_user.id
        task.group_id = scenario.group_id
        task.save
      end
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def deployment_params
      params.require(:deployment).permit(
        :name, 
        :user_id, 
        :project_id,
        :tasks_attributes => [:id, :completed, :_destroy]
        )
    end
end
