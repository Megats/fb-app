class ActiveChartsController < ApplicationController
  before_action :set_active_chart, only: %i[ show edit update destroy ]

  # GET /active_charts or /active_charts.json
  def index
    @active_charts = ActiveChart.all
  end

  # GET /active_charts/1 or /active_charts/1.json
  def show
  end

  # GET /active_charts/new
  def new
    @active_chart = ActiveChart.new
  end

  # GET /active_charts/1/edit
  def edit
  end

  # POST /active_charts or /active_charts.json
  def create
    @active_chart = ActiveChart.new(active_chart_params)

    respond_to do |format|
      if @active_chart.save
        format.html { redirect_to active_chart_url(@active_chart), notice: "Active chart was successfully created." }
        format.json { render :show, status: :created, location: @active_chart }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @active_chart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /active_charts/1 or /active_charts/1.json
  def update
    respond_to do |format|
      if @active_chart.update(active_chart_params)
        format.html { redirect_to active_chart_url(@active_chart), notice: "Active chart was successfully updated." }
        format.json { render :show, status: :ok, location: @active_chart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @active_chart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /active_charts/1 or /active_charts/1.json
  def destroy
    @active_chart.destroy

    respond_to do |format|
      format.html { redirect_to active_charts_url, notice: "Active chart was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_active_chart
      @active_chart = ActiveChart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def active_chart_params
      params.require(:active_chart).permit(:user_id, :post_activetime, :comment_activetime)
    end
end
