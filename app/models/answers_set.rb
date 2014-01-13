class AnswersSet < ActiveRecord::Base
  include Neoid::Node

  ##
  # Associations
  #
  belongs_to :question
  has_many :answers, :through => :has_answers
  has_many :has_answers

end
