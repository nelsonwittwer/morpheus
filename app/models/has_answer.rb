class HasAnswer < ActiveRecord::Base
  include Neoid::Relationship

  ##
  # Associations
  #
  belongs_to :question
  belongs_to :answer

  ##
  # Neoid Conversion
  #

  neoidable do |c|
    c.relationship(:start_node => :question, :end_node => :answer, :type => :has_answer)
  end
end
