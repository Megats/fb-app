class AdminsController < ApplicationController
    before_action :set_admin, only: %i[ show edit update destroy ]  
    before_action :authenticate_admin!
  
    # GET /users or /users.json
    def index
      @posts = Post.joins(:user)
      
      respond_to do |format|
        format.html
        format.json { render json: UserDatatable.new(params) }
      end
      
    end
  
    # GET /users/1 or /users/1.json
    def show
      @admin = Admin.find(params[:id])
  
    end
  
    # GET /users/new
    def new
      @admin = Admin.new
    end
  
    # GET /users/1/edit
    def edit
    end
  
    # POST /users or /users.json
    def create
      @admin = User.new(user_params)
  
      respond_to do |format|
        if @admin.save
          format.html { redirect_to user_url(@admin), notice: "User was successfully created." }
          format.json { render :show, status: :created, location: @admin }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @admin.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /users/1 or /users/1.json
    def update
      respond_to do |format|
        if @admin.update(user_params)
          format.html { redirect_to user_url(@admin), notice: "User was successfully updated." }
          format.json { render :show, status: :ok, location: @admin }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @admin.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /users/1 or /users/1.json
    def destroy
      @admin.destroy
  
      respond_to do |format|
        format.html { redirect_to users_url, notice: "User was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
          @admin = Admin.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def user_params
        params.require(:admin).permit(:user_name)
      end
  end
  