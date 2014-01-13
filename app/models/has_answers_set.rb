class HasAnswersSet < ActiveRecord::Base
  include Neoid::Relationship

  ##
  # Associations
  #
  belongs_to :answers_set
  belongs_to :question

  ##
  # Neoid Conversion
  #

  neoidable do |c|
    c.relationship(:start_node => :question, :end_node => :answers_set, :type => :answers_set)
  end
end
