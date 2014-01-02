class CompletedCheckpointsController < ApplicationController
  before_action :set_completed_checkpoint, only: [:show, :edit, :update, :destroy]

  # GET /completed_checkpoints
  # GET /completed_checkpoints.json
  def index
    @completed_checkpoints = CompletedCheckpoint.all
  end

  # GET /completed_checkpoints/1
  # GET /completed_checkpoints/1.json
  def show
  end

  # GET /completed_checkpoints/new
  def new
    @completed_checkpoint = CompletedCheckpoint.new
  end

  # GET /completed_checkpoints/1/edit
  def edit
  end

  # POST /completed_checkpoints
  # POST /completed_checkpoints.json
  def create
    @completed_checkpoint = CompletedCheckpoint.new(completed_checkpoint_params)

    respond_to do |format|
      if @completed_checkpoint.save
        format.html { redirect_to @completed_checkpoint, notice: 'Completed checkpoint was successfully created.' }
        format.json { render action: 'show', status: :created, location: @completed_checkpoint }
      else
        format.html { render action: 'new' }
        format.json { render json: @completed_checkpoint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /completed_checkpoints/1
  # PATCH/PUT /completed_checkpoints/1.json
  def update
    respond_to do |format|
      if @completed_checkpoint.update(completed_checkpoint_params)
        format.html { redirect_to @completed_checkpoint, notice: 'Completed checkpoint was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @completed_checkpoint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /completed_checkpoints/1
  # DELETE /completed_checkpoints/1.json
  def destroy
    @completed_checkpoint.destroy
    respond_to do |format|
      format.html { redirect_to completed_checkpoints_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_completed_checkpoint
      @completed_checkpoint = CompletedCheckpoint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def completed_checkpoint_params
      params.require(:completed_checkpoint).permit(:checkpoint_id, :student_id)
    end
end
