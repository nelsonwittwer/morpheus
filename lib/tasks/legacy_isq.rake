namespace :legacy_isq do
  desc "Import legacy survey data from csv and populate the Graph DB."
  task import_csv_surveys: :development do
    require 'csv'

    CSV.foreach("#{Rails.root}/public/surveys_with_response_id_20140107.csv", :headers => true) do |row|
      survey = row.to_hash

      ##
      # Questions, Answers, and Checkpoints
      #
      answer_attributes = {
        :id => survey["response_id"],
        :legacy_response_value => survey["legacy_stored_value_for_response"]
      }

      question_attributes = {
        :id => survey["survey_question_id"],
        :parent_question_id => survey["parent_survey_question_id"],
        :language => survey["question_text_language"],
        :parent_question_id => survey["parent_question"],
        :legacy_question_name => survey["legacy_stored_question_name"],
        :posistion => survey["posistion"]
      }

      checkpoint_attributes = {
        :version => survey["survey_version"],
        :type => survey["survey_kind"],
        :type => survey["survey_title"],
      }

      existing_question = Question.find(question_attributes[:id])

      unless existing_question
        question_attributes["language"] == "en" ? question_attributes["english_text"] = survey["question_text"] : question_attributes["spanish_text"] = survey["question_text"]
        Question.create!(question_attributes)
      else
        question_attributes["language"] == "en" ? existing_question.english_text = survey["question_text"] : existing_question.spanish_text = survey["question_text"]
        existing_question.save
      end

      existing_answer = Answer.find(answer_attributes[:id])

      unless existing_answer
        question_attributes["language"] == "en" ? answer_attributes["english_text"] = survey["question_text"] : answer_attributes["spanish_text"] = survey["question_text"]
        Answer.create!(answer_attributes)
      else
        question_attributes["language"] == "en" ? existing_answer.english_text = survey["response_shown"] : existing_answer.spanish_text = survey["response_shown"]
        existing_answer.save
      end

      Checkpoint.find_or_create_by(checkpoint_attributes)
    end

    # We only want one answer node for each text response. IE, there will only be one
    # "Yes" node and one "No" node for all boolean survey questions. This will delete
    # all duplicates and only keep unique english/spanish nodes
    grouped = Answer.all.group_by { |model| [english_text, spanish_text] }
    grouped.values.each do |duplicates|
      # the first one we want to keep right?
      duplicates.shift # or pop for last one
      duplicates.each{|double| double.destroy} # duplicates can now be destroyed
    end

    ##
    # Create possible answer sets and associate questions
    #
    CSV.foreach("#{Rails.root}/public/surveys_with_response_id_20140107.csv", :headers => true) do |row|
      survey = row.to_hash

      existing_answer = Answers.find_by(:english_text => survey["response_shown"])
      existing_answer = Answers.find_by(:spanish_text => survey["response_shown"]) unless existing_answer
      existing_question = Question.find(survey["survey_question_id"])

      if existing_answer.answers_set_id
        next
      elsif existing_question.answers_set_id
        existing_answer.answers_set_id = existing_question.answers_set_id
      else
        existing_answers_set = AnswersSet.create
        existing_answer.answers_set_id = existing_answers_set.id
        existing_question.answers_set_id = existing_answers_set.id
        existing_answer.save
        existing_question.save
      end
    end
  end
end
