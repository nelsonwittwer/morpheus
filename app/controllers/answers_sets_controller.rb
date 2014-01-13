class AnswersSetsController < ApplicationController
  before_action :set_answers_set, only: [:show, :edit, :update, :destroy]

  # GET /answers_sets
  # GET /answers_sets.json
  def index
    @answers_sets = AnswersSet.all
  end

  # GET /answers_sets/1
  # GET /answers_sets/1.json
  def show
  end

  # GET /answers_sets/new
  def new
    @answers_set = AnswersSet.new
  end

  # GET /answers_sets/1/edit
  def edit
  end

  # POST /answers_sets
  # POST /answers_sets.json
  def create
    @answers_set = AnswersSet.new(answers_set_params)

    respond_to do |format|
      if @answers_set.save
        format.html { redirect_to @answers_set, notice: 'Possible answers set was successfully created.' }
        format.json { render action: 'show', status: :created, location: @answers_set }
      else
        format.html { render action: 'new' }
        format.json { render json: @answers_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers_sets/1
  # PATCH/PUT /answers_sets/1.json
  def update
    respond_to do |format|
      if @answers_set.update(answers_set_params)
        format.html { redirect_to @answers_set, notice: 'Possible answers set was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @answers_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers_sets/1
  # DELETE /answers_sets/1.json
  def destroy
    @answers_set.destroy
    respond_to do |format|
      format.html { redirect_to answers_sets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answers_set
      @answers_set = AnswersSet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answers_set_params
      params.require(:answers_set).permit(:question_id)
    end
end
