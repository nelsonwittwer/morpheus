namespace :legacy_isq do
  desc "Import legacy survey data from csv and populate the Graph DB."
  task :import_csv_surveys => :environment do
    require 'csv'

    CSV.foreach("#{Rails.root}/public/surveys_20140113.csv", :headers => true) do |row|
      survey = row.to_hash

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
        Question.create!(question_attributes)
      else
        survey["question_text_language"] == "en" ? existing_question.english_text = survey["question_text"] : existing_question.spanish_text = survey["question_text"]
        existing_question.save
      end

      existing_answer = Answer.find_by_id(answer_attributes[:id])

      unless existing_answer
        survey["question_text_language"] == "en" ? answer_attributes["english_text"] = survey["response_shown"] : answer_attributes["spanish_text"] = survey["response_shown"]
        Answer.create!(answer_attributes)
      else
        survey["question_text_language"] == "en" ? existing_answer.english_text = survey["response_shown"] : existing_answer.spanish_text = survey["response_shown"]
        existing_answer.save
      end

      Checkpoint.where(checkpoint_attributes).first_or_create
    end
  end

  task :remove_duplicate_answers => :environment do
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

  task :create_answers_sets => :environment do
    ##
    # Create possible answer sets and associate questions
    #
    CSV.foreach("#{Rails.root}/public/surveys_20140113.csv", :headers => true) do |row|
      survey = row.to_hash

      existing_answer = Answer.find_by(:english_text => survey["response_shown"])
      existing_answer = Answer.find_by(:spanish_text => survey["response_shown"]) unless existing_answer

      # TODO There are two spanish answers for the same english answer in some cases
      puts "!!!" unless existing_answer
      p survey unless existing_answer
      next unless existing_answer

      existing_question = Question.find_by_id(survey["survey_question_id"])

      if existing_answer.try(:answers_set_id)
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
