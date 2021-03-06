class ScenariosController < ApplicationController
  load_and_authorize_resource

  before_action :set_scenario, only: [:show, :edit, :update, :destroy]

  # GET /scenarios
  # GET /scenarios.json
  def index
    @scenarios = Scenario.all
  end

  # GET /scenarios/1
  # GET /scenarios/1.json
  def show
  end

  # GET /scenarios/new
  def new
    @scenario = Scenario.new
    @scenario.group_id = params[:group_id]
    @scenario.steps.build
    @scenario.assumptions.build
  end

  # GET /scenarios/1/edit
  def edit
    @scenario.steps.build
    @scenario.assumptions.build
  end

  # POST /scenarios
  # POST /scenarios.json
  def create
    @scenario = Scenario.new(scenario_params)
    @scenario.user_id = current_user.id

    respond_to do |format|
      if @scenario.save
        @scenario.sync_deployments
        format.html { redirect_to edit_project_path(@scenario.group.project), notice: 'Scenario was successfully created.' }
        format.json { render :show, status: :created, location: @scenario }
      else
        format.html { render :new }
        format.json { render json: @scenario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scenarios/1
  # PATCH/PUT /scenarios/1.json
  def update
    respond_to do |format|
      if @scenario.update(scenario_params)
        format.html { redirect_to edit_project_path(@scenario.group.project), notice: 'Scenario was successfully updated.' }
        format.json { render :show, status: :ok, location: @scenario }
      else
        format.html { render :edit }
        format.json { render json: @scenario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scenarios/1
  # DELETE /scenarios/1.json
  def destroy
    project = @scenario.project
    @scenario.destroy
    respond_to do |format|
      format.html { redirect_to edit_project_path(project) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scenario
      @scenario = Scenario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scenario_params
      params.require(:scenario).permit(
        :name, 
        :expected, 
        :notes, 
        :priority, 
        :user_id, 
        :group_id, 
        :steps_attributes => [:id, :instruction, :_destroy],
        :assumptions_attributes => [:id, :instruction, :_destroy]
      )
    end
end
