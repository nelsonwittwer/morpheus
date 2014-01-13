class ParentQuestionsController < ApplicationController
  before_action :set_parent_question, only: [:show, :edit, :update, :destroy]

  # GET /parent_questions
  # GET /parent_questions.json
  def index
    @parent_questions = ParentQuestion.all
  end

  # GET /parent_questions/1
  # GET /parent_questions/1.json
  def show
  end

  # GET /parent_questions/new
  def new
    @parent_question = ParentQuestion.new
  end

  # GET /parent_questions/1/edit
  def edit
  end

  # POST /parent_questions
  # POST /parent_questions.json
  def create
    @parent_question = ParentQuestion.new(parent_question_params)

    respond_to do |format|
      if @parent_question.save
        format.html { redirect_to @parent_question, notice: 'Parent question was successfully created.' }
        format.json { render action: 'show', status: :created, location: @parent_question }
      else
        format.html { render action: 'new' }
        format.json { render json: @parent_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parent_questions/1
  # PATCH/PUT /parent_questions/1.json
  def update
    respond_to do |format|
      if @parent_question.update(parent_question_params)
        format.html { redirect_to @parent_question, notice: 'Parent question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @parent_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parent_questions/1
  # DELETE /parent_questions/1.json
  def destroy
    @parent_question.destroy
    respond_to do |format|
      format.html { redirect_to parent_questions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parent_question
      @parent_question = ParentQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parent_question_params
      params[:parent_question]
    end
end
