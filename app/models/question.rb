class Question < ActiveRecord::Base
  include Neoid::Node

  ##
  # Associations
  #
  belongs_to :checkpoint
  has_one :answers_set, :through => :has_answers_set
  has_one :has_answers_set
  has_one :parent_question

  ##
  # Neoid Conversion
  #
  neoidable do |c|
    c.field "answer_type"
    c.field "name"
    c.field "posistion"
    c.field "english_text"
    c.field "spanish_text"
    c.field "legacy_question_name"
    c.field "created_at"
    c.field "updated_at"
  end
end
