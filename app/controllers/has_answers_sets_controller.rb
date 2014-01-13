class HasAnswersSetsController < ApplicationController
  before_action :set_has_answers_set, only: [:show, :edit, :update, :destroy]

  # GET /has_answers_sets
  # GET /has_answers_sets.json
  def index
    @has_answers_sets = HasAnswersSet.all
  end

  # GET /has_answers_sets/1
  # GET /has_answers_sets/1.json
  def show
  end

  # GET /has_answers_sets/new
  def new
    @has_answers_set = HasAnswersSet.new
  end

  # GET /has_answers_sets/1/edit
  def edit
  end

  # POST /has_answers_sets
  # POST /has_answers_sets.json
  def create
    @has_answers_set = HasAnswersSet.new(has_answers_set_params)

    respond_to do |format|
      if @has_answers_set.save
        format.html { redirect_to @has_answers_set, notice: 'Has possible answers set was successfully created.' }
        format.json { render action: 'show', status: :created, location: @has_answers_set }
      else
        format.html { render action: 'new' }
        format.json { render json: @has_answers_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /has_answers_sets/1
  # PATCH/PUT /has_answers_sets/1.json
  def update
    respond_to do |format|
      if @has_answers_set.update(has_answers_set_params)
        format.html { redirect_to @has_answers_set, notice: 'Has possible answers set was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @has_answers_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /has_answers_sets/1
  # DELETE /has_answers_sets/1.json
  def destroy
    @has_answers_set.destroy
    respond_to do |format|
      format.html { redirect_to has_answers_sets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_has_answers_set
      @has_answers_set = HasAnswersSet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def has_answers_set_params
      params.require(:has_answers_set).permit(:answers_set_id, :question_id)
    end
end
