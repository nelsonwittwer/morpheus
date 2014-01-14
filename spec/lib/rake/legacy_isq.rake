require 'spec_helper'
require 'rake'

describe 'legacy_isq' do
  before :all do
    Rake.application.rake_require "tasks/legacy_isq"
    Rake::Task.define_task(:environment)
  end

  context 'import_csv_surveys' do
    let :run_rake_task do
      Rake::Task["legacy_isq:import_csv_surveys"].reenable
      Rake.application.invoke_task "legacy_isq:import_csv_surveys"
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
    let(:expected_question) { Quesiton.new(question_attributes) }
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

    it 'creates one answer with both english and spanish texts' do
      run_rake_task
      answer = Answer.find(135)
      answer.should eq(expected_answer)
    end

    it 'creates one unique checkpoint depending on attributes' do
      run_rake_task
      checkpoint = Checkpoint.find(39)
      checkpoint.should eq(expected_checkpoint)
    end
  end
end
