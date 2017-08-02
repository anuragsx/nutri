class HealthGoalsController < ApplicationController
  before_action :set_health_goal, only: [:show, :edit, :update, :destroy]

  # GET /health_goals
  # GET /health_goals.json
  def index
    @health_goals = HealthGoal.all
  end

  # GET /health_goals/1
  # GET /health_goals/1.json
  def show
  end

  # GET /health_goals/new
  def new
    @health_goal = HealthGoal.new
  end

  # GET /health_goals/1/edit
  def edit
  end

  # POST /health_goals
  # POST /health_goals.json
  def create
    @health_goal = HealthGoal.new(health_goal_params)

    respond_to do |format|
      if @health_goal.save
        format.html { redirect_to @health_goal, notice: 'Health goal was successfully created.' }
        format.json { render :show, status: :created, location: @health_goal }
      else
        format.html { render :new }
        format.json { render json: @health_goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /health_goals/1
  # PATCH/PUT /health_goals/1.json
  def update
    respond_to do |format|
      if @health_goal.update(health_goal_params)
        format.html { redirect_to @health_goal, notice: 'Health goal was successfully updated.' }
        format.json { render :show, status: :ok, location: @health_goal }
      else
        format.html { render :edit }
        format.json { render json: @health_goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /health_goals/1
  # DELETE /health_goals/1.json
  def destroy
    @health_goal.destroy
    respond_to do |format|
      format.html { redirect_to health_goals_url, notice: 'Health goal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_health_goal
      @health_goal = HealthGoal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def health_goal_params
      params.require(:health_goal).permit(:goal_name, :goal_desc)
    end
end
