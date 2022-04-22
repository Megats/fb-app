class UserChartsController < ApplicationController
  before_action :set_user_chart, only: %i[ show edit update destroy ]

  # GET /user_charts or /user_charts.json
  def index
    @user_charts = UserChart.all
  end

  # GET /user_charts/1 or /user_charts/1.json
  def show
  end

  # GET /user_charts/new
  def new
    @user_chart = UserChart.new
  end

  # GET /user_charts/1/edit
  def edit
  end

  # POST /user_charts or /user_charts.json
  def create
    @user_chart = UserChart.new(user_chart_params)

    respond_to do |format|
      if @user_chart.save
        format.html { redirect_to user_chart_url(@user_chart), notice: "User chart was successfully created." }
        format.json { render :show, status: :created, location: @user_chart }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_chart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_charts/1 or /user_charts/1.json
  def update
    respond_to do |format|
      if @user_chart.update(user_chart_params)
        format.html { redirect_to user_chart_url(@user_chart), notice: "User chart was successfully updated." }
        format.json { render :show, status: :ok, location: @user_chart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_chart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_charts/1 or /user_charts/1.json
  def destroy
    @user_chart.destroy

    respond_to do |format|
      format.html { redirect_to user_charts_url, notice: "User chart was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_chart
      @user_chart = UserChart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_chart_params
      params.require(:user_chart).permit(:user_name)
    end
end
