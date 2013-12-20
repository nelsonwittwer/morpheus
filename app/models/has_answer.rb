class HasAnswer < ActiveRecord::Base
  include Neoid::Relationship

  ##
  # Associations
  #
  belongs_to :answer
  belongs_to :question

  ##
  # Neoid Conversion
  #

  neoidable do |c|
    c.relationship(:start_node => :question, :end_node => :answer, :type => :has_answer)
  end
end
