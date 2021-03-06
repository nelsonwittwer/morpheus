require 'spec_helper'
require 'rake'

describe 'legacy_isq' do
  before :all do
    Rake.application.rake_require "tasks/legacy_isq"
    Rake::Task.define_task(:environment)
  end

  context 'import_csv_surveys' do
    let :run_rake_task do
      Rake::Task["legacy_isq:import_legacy_survey_data"].reenable
      Rake.application.invoke_task "legacy_isq:import_legacy_survey_data"
    end

    let(:question_attributes) {
      {
        :id => 47,
        :parent_question_id => nil,
        :legacy_question_name => 'l4',
        :posistion => 3,
        :english_text => "My parents support extracurricular activities at this school",
        :spanish_text => "Mis padres apoyan las actividades extra-escolares",
      }
    }
    let(:expected_question) { Question.new(question_attributes) }
    let(:answer_attributes) {
      {
        :id => 135,
        :legacy_response_value => 3,
        :english_text => "Disagree",
        :spanish_text => "En desacuerdo"
      }
    }
    let(:expected_answer) { Answer.new(answer_attributes) }
    let(:checkpoint_attributes) {
      {
        :version => "PULSE 2013",
        :actor => "PULSE Elementary",
        :title => "PULSE",
        :id => 39,
      }
    }
    let(:expected_checkpoint) { Checkpoint.new(checkpoint_attributes) }

    it 'creates one question with both english and spanish texts' do
      run_rake_task
      question = Question.find(47)
      question.should eq(expected_question)
    end

    context 'remove_duplicate_answers' do
      it 'should only have one "Yes" response' do
        run_rake_task
        yes_answer = Answer.where(:english_text => "Yes")
        yes_answer.count.should eq(1)
        yes_answer.first.spanish_text.should eq("Si")
      end

      it 'should only have one "No" response' do
        run_rake_task
        yes_answer = Answer.where(:english_text => "No")
        yes_answer.count.should eq(1)
        yes_answer.first.spanish_text.should eq("No")
      end
    end

    context 'create_graph_associations' do
      it 'creates answers sets for each question' do
        run_rake_task
        orphan_questions = Question.where(:answers_set_id => nil)
        p orphan_questions unless orphan_questions.empty?
        orphan_questions.should be_empty
      end

      it 'creates answers sets for each answer' do
        run_rake_task
        orphan_answers = Answer.where(:answers_set_id => nil)
        p orphan_answers unless orphan_answers.empty?
        orphan_answers.should be_empty
      end
    end
  end
end
