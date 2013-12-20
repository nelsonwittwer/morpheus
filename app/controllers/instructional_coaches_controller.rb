class InstructionalCoachesController < ApplicationController
  before_action :set_instructional_coach, only: [:show, :edit, :update, :destroy]

  # GET /instructional_coaches
  # GET /instructional_coaches.json
  def index
    @instructional_coaches = InstructionalCoach.all
  end

  # GET /instructional_coaches/1
  # GET /instructional_coaches/1.json
  def show
  end

  # GET /instructional_coaches/new
  def new
    @instructional_coach = InstructionalCoach.new
  end

  # GET /instructional_coaches/1/edit
  def edit
  end

  # POST /instructional_coaches
  # POST /instructional_coaches.json
  def create
    @instructional_coach = InstructionalCoach.new(instructional_coach_params)

    respond_to do |format|
      if @instructional_coach.save
        format.html { redirect_to @instructional_coach, notice: 'Instructional coach was successfully created.' }
        format.json { render action: 'show', status: :created, location: @instructional_coach }
      else
        format.html { render action: 'new' }
        format.json { render json: @instructional_coach.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instructional_coaches/1
  # PATCH/PUT /instructional_coaches/1.json
  def update
    respond_to do |format|
      if @instructional_coach.update(instructional_coach_params)
        format.html { redirect_to @instructional_coach, notice: 'Instructional coach was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @instructional_coach.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instructional_coaches/1
  # DELETE /instructional_coaches/1.json
  def destroy
    @instructional_coach.destroy
    respond_to do |format|
      format.html { redirect_to instructional_coaches_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instructional_coach
      @instructional_coach = InstructionalCoach.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instructional_coach_params
      params[:instructional_coach]
    end
end
