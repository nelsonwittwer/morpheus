namespace :legacy_isq do
  class SurveyImporter
    attr_accessor :csv_array_of_hashes

    def initialize
      self.csv_array_of_hashes = csv_to_array_of_hashes
    end

    def import_survey_data
      csv_array_of_hashes.each do |row|
        create_nodes_from_row(row)
      end

      remove_duplicate_answers

      csv_array_of_hashes.each do |row|
        create_graph_assoications(row)
      end
    end

    private

    def answer_set_on_answer_but_not_on_question?(existing_answer, existing_question)
      existing_answer.answers_set && existing_question.answers_set == nil
    end

    def answer_set_on_question_but_not_on_answer?(existing_answer, existing_question)
      existing_question.answers_set && existing_answer.answers_set == nil
    end


    def create_graph_assoications(survey)
      existing_answer = Answer.find_by(:english_text => survey["response_shown"])
      existing_answer = Answer.find_by(:spanish_text => survey["response_shown"]) unless existing_answer

      existing_question = Question.find_by_id(survey["survey_question_id"])

      if answer_set_on_answer_but_not_on_question?(existing_answer, existing_question)
        existing_question.answers_set = existing_answer.answers_set
      elsif answer_set_on_question_but_not_on_answer(existing_answer, existing_question)
        existing_answer.answers_set = existing_question.answers_set
      else
        existing_answers_set = AnswersSet.create
        existing_answers_set.answers << existing_answer
        existing_question.answers_set = existing_answers_set
      end

      checkpoint = Checkpoint.find(survey["survey_id"])
      checkpoint.questions << existing_question
    end

    def create_nodes_from_row(survey)
      ##
      # Questions, Answers, and Checkpoints
      #
      answer_attributes = {
        :id => survey["response_id"].to_i,
        :legacy_response_value => survey["legacy_stored_value_for_response"]
      }

      question_attributes = {
        :id => survey["survey_question_id"].to_i,
        :parent_question_id => survey["parent_survey_question_id"],
        :legacy_question_name => survey["legacy_stored_question_name"],
        :posistion => survey["question_order_position"]
      }

      checkpoint_attributes = {
        :version => survey["survey_version"],
        :actor => survey["survey_kind"],
        :title => survey["survey_title"],
        :id => survey["survey_id"].to_i,
      }

      existing_question = Question.find_by_id(question_attributes[:id])

      unless existing_question
        survey["question_text_language"] == "en" ? question_attributes["english_text"] = survey["question_text"] : question_attributes["spanish_text"] = survey["question_text"]
        Question.create(question_attributes)
      else
        survey["question_text_language"] == "en" ? existing_question.english_text = survey["question_text"] : existing_question.spanish_text = survey["question_text"]
        existing_question.save
      end

      existing_answer = Answer.find_by_id(answer_attributes[:id])

      unless existing_answer
        survey["question_text_language"] == "en" ? answer_attributes["english_text"] = survey["response_shown"] : answer_attributes["spanish_text"] = survey["response_shown"]
        Answer.create(answer_attributes)
      else
        survey["question_text_language"] == "en" ? existing_answer.english_text = survey["response_shown"] : existing_answer.spanish_text = survey["response_shown"]
        existing_answer.save
      end

      Checkpoint.where(checkpoint_attributes).first_or_create
    end

    def csv_to_array_of_hashes
      file_path = "#{Rails.root}/public/surveys_20140113.csv"
      CSV.read(file_path, :headers => true).collect do |row|
        Hash[row.collect { |c,r| [c,r] }]
      end
    end

    # The idea here is to have one node for each answer. So there will only
    # be one "True" node and one "False" node for all the true false
    # questions in the database
    def remove_duplicate_answers
      all_answers = Answer.all.map { |answer| answer.dup }
      Answer.delete_all

      all_answers.each do |answer|
        new_answer = Answer.find_by(:english_text => answer.english_text)

        unless new_answer
          Answer.create(:english_text => answer.english_text, :spanish_text => answer.spanish_text)
        end

        if new_answer && new_answer.spanish_text == nil && answer.spanish_text
          new_answer.spanish_text = answer.spanish_text
          new_answer.save
        end
      end
    end
  end

  desc "Import legacy survey data from csv and populate the Graph DB."
  task :import_legacy_survey_data => :environment do
    importer = SurveyImporter.new
    importer.import_survey_data
  end
end
